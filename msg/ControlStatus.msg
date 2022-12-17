# Interface definition for control status indicator.

bool controlled  # If ``true``, this component has valid control command now.
bool remote      # If ``true``, this component is remotely controlled
float64 time     # Timestamp of this status
