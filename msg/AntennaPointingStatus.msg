# Consolidated antenna pointing/tracking status for progress/diagnostics.
#
# Coordinates are low-level apparent Alt-Az values in degrees. Derived RA/Dec or
# Galactic display coordinates should be calculated by a display/analysis layer
# using neclib/astropy with the timestamps below.

bool valid

float64 publish_time_unix
float64 command_time_unix
float64 encoder_time_unix

float64 cmd_az_deg
float64 cmd_el_deg
float64 enc_az_deg
float64 enc_el_deg

float64 delta_az_deg             # encoder - command, shortest signed Az difference [deg].
float64 delta_el_deg             # encoder - command [deg].
float64 delta_az_cos_el_deg      # delta_az_deg * cos(encoder elevation) [deg].
float64 tracking_error_deg       # sqrt(delta_az_cos_el_deg^2 + delta_el_deg^2).
float64 tracking_threshold_deg
bool tracking_ok

float64 cmd_age_sec
float64 enc_age_sec
bool command_stale
bool encoder_stale

float64 cmd_az_rate_deg_per_sec
float64 cmd_el_rate_deg_per_sec
float64 enc_az_rate_deg_per_sec
float64 enc_el_rate_deg_per_sec

string<=32 basis                 # interpolated, unavailable, stale-command, stale-encoder, ...
