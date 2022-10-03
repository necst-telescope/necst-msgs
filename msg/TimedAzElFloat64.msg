# Generic data type for set of float64 values for az/el axes, with timestamp.

float64 az    # Value for azimuth axis.
float64 el    # Value for elevation (altitude) axis.
float64 time  # Time at which the data is published or is valid.

# ## Example
# ```python
# >>> from necst_msgs.msg import TimedAzElFloat64
# >>> msg = TimedAzElFloat64(az=2.0, el=0.1, time=1664792192.3645709)
# ```
