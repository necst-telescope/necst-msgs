# Antenna command queue and publish-horizon diagnostics.
#
# This status is intended for Progress UI/debugging. It must not be used as a
# replacement for the actual command stream.

bool active
string<=64 control_id
string<=32 mode

float64 publish_time_unix
float64 command_offset_sec
float64 min_buffer_sec
float64 max_buffer_sec

int32 queue_length
float64 head_lead_sec
float64 tail_lead_sec

float64 last_publish_wall_time_unix
float64 last_published_cmd_time_unix
float64 publish_gap_sec

bool generator_exhausted
bool guard_latched
string<=64 reason
