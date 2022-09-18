# Data type for grouped celestial coordinate information.

float64[] lon   # Longitude in floating point value. Hour angle won't be accepted.
float64[] lat   # Latitude.
string unit     # Angular unit in which the longitude and latitude are given.
string frame    # Coordinate frame in which the longitude and latitude are given.
float64[] time  # Time the instructed coordinate si valid at, considering sidereal motion.
string name     # Name of celestial body.
