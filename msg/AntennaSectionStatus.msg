# High-level antenna control-section status for progress/diagnostics.
#
# This message is additive. Existing ControlStatus remains the source used by
# legacy metadata gating. This status describes the section that corresponds to
# the current wall-clock/query time, not the farthest future command already
# published to the antenna drive queue.

bool active                    # True when a current control section is known.
string<=64 control_id           # Execution/control ID associated with this section.

string<=96 section_uid          # Stable section identifier within the execution when available.
int32 section_plan_index        # Planned section index inside a scan block, or -1 if N/A.
int32 section_sequence_index    # Runtime section activation sequence, or -1 if N/A.

string<=64 section_kind         # initial_standby, accelerate, line, decelerate, turn, ...
string<=64 section_label        # Human-readable label, often an ON line label.
int32 line_index                # 0-based scan-line index, or -1 if N/A.

float64 section_start_unix      # Section start time [Unix seconds], if known.
float64 section_stop_unix       # Section stop time [Unix seconds], if known.
float64 section_duration_sec    # Section duration [s], if known.

float64 query_time_unix         # Wall-clock time used to select the current section.
float64 publish_time_unix       # Wall-clock time this status was published.
float64 command_time_unix       # Command-time sample used for the status; normally query_time_unix.

float64 nominal_fraction        # Command-time progress in this section, 0..1 when valid.
bool fraction_valid             # True when nominal_fraction is meaningful.

bool tight                      # Strict/tight control requested for this section.
bool science_line               # True for science ON line sections.
bool interrupt_ok               # True when interruption is safe for this section.

bool geometry_valid             # True when planned section geometry fields are meaningful.
string<=32 section_frame        # Coordinate frame of the planned section geometry.
string<=16 section_unit         # Unit of geometry longitude/latitude values; degrees in v39.
float64 section_start_lon_deg   # Planned start longitude [deg], if geometry_valid.
float64 section_start_lat_deg   # Planned start latitude [deg], if geometry_valid.
float64 section_stop_lon_deg    # Planned stop longitude [deg], if geometry_valid.
float64 section_stop_lat_deg    # Planned stop latitude [deg], if geometry_valid.
float64 section_speed_deg_per_sec # Planned section speed [deg/s], if known.

string<=32 status_basis         # current-time, horizon, idle, fallback, stale, ...
