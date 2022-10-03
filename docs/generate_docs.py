#!/usr/bin/env python3

import itertools
import re
import shutil
from pathlib import Path
from typing import Dict, Sequence

# import markdown

pkg_name = "necst_msgs"

proj_root = Path(__file__).parent.parent

section_roots = {
    "msg": proj_root / "msg",
    "srv": proj_root / "srv",
}

public_root = Path(__file__).parent / "public"

def_matcher = re.compile(r"^([\w\[\]]+)\s*([\w_]+)\s*#?(.*)$")
comment_matcher = re.compile(r"^\s*(?![\w]).*")

def generate(source: Path) -> str:
    relative_path = source.relative_to(proj_root).with_suffix("")
    _title = f"# {pkg_name}/{relative_path}".replace("/", ".")
    title = [_title, ""]

    raw = source.read_text().splitlines()

    _description = itertools.takewhile(
        lambda line: comment_matcher.match(line) is not None, raw
    )
    description = [line.strip("#").strip() for line in _description]

    _defs = [def_matcher.match(line) for line in raw]
    _defs = filter(lambda x: x is not None, _defs)
    _defs = map(lambda x: x.groups(), _defs)
    defs = ["## Fields", ""] + [
        f"- {name} ({type_}) -- {description}" for type_, name, description in _defs
    ] + [""]

    _post_notes = itertools.takewhile(
        lambda line: comment_matcher.match(line) is not None, reversed(raw)
    )
    _post_notes = [line.strip("#").strip() for line in reversed(list(_post_notes))]
    post_notes = [] if len(_post_notes) == 0 else ["## Notes", ""] + _post_notes

    return "\n".join([*title, *description, *defs, *post_notes])

def generate_index(doc_path: Dict[str, Sequence[Path]]) -> str:
    title = [f"# {pkg_name}", ""]
    sections = []
    for section, paths in doc_path.items():
        section_title = f"## {section}"
        relative_paths = [path.relative_to(public_root) for path in paths]
        section_content = [f"- [{path.stem}]({path.name})" for path in relative_paths]
        sections.extend([section_title, "", *section_content, ""])
    return "\n".join([*title, *sections])

def write(src_path: Path, content: str) -> Path:
    doc_path = public_root / src_path.relative_to(proj_root).with_suffix(".html")


if __name__ == "__main__":
    if public_root.exists():
        shutil.rmtree(public_root)
    public_root.mkdir()

    generated_path = {}
    for section, root in section_roots.items():
        files = list(root.glob("*"))
        generated = [generate(p) for p in files]
        generated_path[section] = [write(p, c) for p, c in zip(files, generated)]
    # index = generate_index(generated_path)
    # write(proj_root / "index.md", index)


