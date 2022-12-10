# Data type for spectral data.

float32[] data      # The spectral data.
string<=8 position  # Observing position, such as ON, OFF, HOT, etc., up to 8 characters.
string<=16 id       # Specific ID for current data, up to 16 characters.
float64 time        # Time the data is taken on.

# ## Example
# ```python
# >>> from necst_msgs.msg import Spectral
# >>> msg = Spectral(
# ...     data=[1., 2., 3.], position="SKY", id="skydip_el=30" , time=1664792192.3645709
# ... )
# ```