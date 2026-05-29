# Azimuth unwrap status for absolute modulo antenna encoders.
# This message is published only by deployments that enable azimuth unwrap.

bool enabled
bool valid
string<=32 mode
string<=32 state       # ok, disabled, ambiguous, no-valid-branch, jump, error, stale, ...
string<=128 reason

float64 publish_time_unix
float64 encoder_time_unix

float64 raw_az_deg         # Absolute modulo encoder reading after device readout [deg].
float64 modulo_az_deg      # Calibrated modulo azimuth after sign/zero_offset [deg].
float64 continuous_az_deg  # Continuous azimuth used on /antenna/encoder [deg].
int32 branch               # round((continuous_az_deg - modulo_az_deg) / period_deg)
bool branch_nonzero
bool branch_changed

float64 period_deg
float64 drive_min_deg
float64 drive_max_deg
float64 state_age_sec
float64 persist_age_sec
