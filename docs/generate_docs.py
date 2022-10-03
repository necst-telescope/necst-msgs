#!/usr/bin/env python3

import itertools
import os
import re
import shutil
from pathlib import Path
from typing import Dict, Sequence

import markdown

pkg_name = "necst_msgs"

proj_root = Path(__file__).parent.parent
index_path = proj_root / "index.md"  # Virtual path, will be converted.

section_roots = {
    "msg": proj_root / "msg",
    "srv": proj_root / "srv",
}

public_root = Path(__file__).parent / "public"

def_matcher = re.compile(r"^([\w\[\]]+)\s*([\w_]+)\s*#?(.*)$")
comment_matcher = re.compile(r"^\s*(?![\w]).*")

style = """<style>
body {
    padding: 7px;
}
pre {
    background-color: #EFF;
    border: 3px ridge #777;
    padding: 10px;
}

code {
    color: #A1F;
}
</style>
"""

def generate(source: Path) -> str:
    relative_path = source.relative_to(proj_root).with_suffix("")
    _title = f"# `{pkg_name}/{relative_path}`".replace("/", ".")
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

    raw_code = ["## Raw definition", "", "```plaintext", *raw, "```", ""]

    index = os.path.relpath(convert_path(index_path), convert_path(source).parent)
    home = ["---", "", f"[Home]({index})", ""]

    return "\n".join([*title, *description, *defs, *post_notes, *raw_code, *home])

def generate_index(doc_path: Dict[str, Sequence[Path]]) -> str:
    title = [f"# {pkg_name}", ""]
    sections = []
    for section, paths in doc_path.items():
        section_title = f"## {section}"
        relative_paths = [path.relative_to(public_root) for path in paths]
        section_content = [f"- [{path.stem}]({path})" for path in relative_paths]
        sections.extend([section_title, "", *section_content, ""])
    return "\n".join([*title, *sections])

def attach_style(md_content: str) -> str:
    return style + md_content

def convert_path(path: Path) -> Path:
    return public_root / path.relative_to(proj_root).with_suffix(".html")

def write(src_path: Path, content: str) -> Path:
    doc_path = convert_path(src_path)
    doc_path.parent.mkdir(parents=True, exist_ok=True)
    doc_path.touch(exist_ok=True)
    md_content = markdown.markdown(content, extensions=["tables", "fenced_code"])
    doc_path.write_text(md_content)
    return doc_path


if __name__ == "__main__":
    if public_root.exists():
        shutil.rmtree(public_root)
    public_root.mkdir()

    generated_path = {}
    for section, root in section_roots.items():
        files = list(root.glob("*"))
        generated = [generate(p) for p in files]
        styled = [attach_style(g) for g in generated]
        generated_path[section] = [write(p, c) for p, c in zip(files, styled)]
    index = generate_index(generated_path)
    styled_index = attach_style(index)
    p = write(index_path, styled_index)


