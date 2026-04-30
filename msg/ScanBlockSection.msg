# A single control section in a continuous scan block.
#
# All angular quantities are interpreted in the section's ``frame`` and in the
# ``unit`` given by the parent ``ScanBlockCommand`` request.
#
# The section sequence itself encodes the geometric block shape. The service
# request provides the shared target/name/offset context, while each section
# provides the relative path piece to execute.
#
# ``start`` and ``stop`` are two-component vectors [lon, lat] in the section
# frame. Their meaning depends on ``kind``:
# - LINE: start and stop of the constant-speed data-taking segment.
# - ACCELERATE / DECELERATE: start and stop of the ramp segment.
# - TURN: entry and exit point of the turn segment.
# - FIRST_STANDBY / FINAL_STANDBY / MOVE_TO_ENTRY: holding point. In these
#   cases ``start`` and ``stop`` should usually be identical.
#
# ``tight`` is the intended recording gate for this section. Initial design:
# only LINE sections use tight=true.

uint8 MOVE_TO_ENTRY=0
uint8 FIRST_STANDBY=1
uint8 ACCELERATE=2
uint8 LINE=3
uint8 TURN=4
uint8 DECELERATE=5
uint8 FINAL_STANDBY=6

uint8 kind               # Section kind. Use one of the constants above.
bool tight               # Intended recording gate for this section.
string<=64 label         # Optional human-readable label, e.g. "line-01".
int32 line_index         # Line number for metadata / logging. -1 if N/A.
float64[2] start         # [lon, lat] start point in ``frame`` / parent ``unit``.
float64[2] stop          # [lon, lat] stop point in ``frame`` / parent ``unit``.
string frame             # Coordinate frame for start/stop.
float64 speed            # Section speed in parent ``unit``/s. 0 for pure hold.
float64 margin           # Section-local margin in parent ``unit``. 0 if unused.
float64 duration_hint    # Optional hint [s]. 0 means "derive from geometry".
float64 turn_radius_hint # Optional turn-radius hint in parent ``unit``.
