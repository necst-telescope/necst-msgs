# Interface definition for control status indicator.

bool controlled    # If ``true``, this component has valid control command now.
bool tight         # Strict control is enabled or not.
bool remote        # If ``true``, this component is remotely controlled
string<=64 id      # Control section identifier.
bool interrupt_ok  # If ``true``, this section isn't followed by bound tight control.
float64 time       # Timestamp of this status
string<=64 section_kind   # Fine section kind within a block, e.g. line/turn
string<=64 section_label  # Fine section label; for line sections this may be line ID
int32 line_index          # Fine line index inside a scan block, or -1 if N/A
