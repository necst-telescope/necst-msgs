# Data type for celestial coordinate information.
# This message can be used for coordinate specification (lon, lat, unit, frame, time)
# and name query (name, time).

float64 lon   # Longitude in floating point value. Hour angle won't be accepted.
float64 lat   # Latitude.
string unit   # Angular unit in which the longitude and latitude are given.
string frame  # Coordinate frame in which the longitude and latitude are given.
float64 time  # Time the instructed coordinate is valid at, considering sidereal motion.
string name   # Name of celestial body.

# ## Example
# ```python
# >>> from necst_msgs.msg import CoordMsg
# >>> msg1 = CoordMsg(
# ...     lon=5.0, lat=6.1, unit="deg", frame="fk5", time=1664792192.3645709
# ... )
# >>> msg2 = CoordMsg(name="pollux", time=1664792192.3645709)
# ```
