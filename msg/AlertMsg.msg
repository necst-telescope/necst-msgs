# Data type for alert information.

float64 threshold  # Threshold of critical condition.
float64 actual     # Actual value to compare with ``threshold``.
bool warning       # If ``true``, the situation nears the threshold.
bool critical      # If ``true``, the situation has exceeded the threshold, and safeguard will be activated.
string issuer      # Publisher's node name, which indicate the type of alert.
