# Generic data type for set of int64 values for az/el axes, with timestamp.

int64 az    # Value for azimuth axis.
int64 el    # Value for elevation (altitude) axis.
float64 time  # Time at which the data is published or is valid.

# ## Example
# ```python
# >>> from necst_msgs.msg import TimedAzElInt64
# >>> msg = TimedAzElInt64(az=1, el=0, time=1664792192.3645709)
# ```
