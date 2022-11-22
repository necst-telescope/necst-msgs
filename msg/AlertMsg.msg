# Data type for alert information.

float64[] threshold  # Threshold of critical condition.
float64 actual     # Actual value to compare with ``threshold``.
bool warning       # If ``true``, the situation nears the threshold.
bool critical      # If ``true``, the situation has exceeded the threshold, and safeguard will be activated.
string[] target    # Part(s) of the system this alert information is valid.

# ## Example
# ```python
# >>> from necst_msgs.msg import AlertMsg
# >>> msg = AlertMsg(
# ...     threshold=5.0, actual=6.1, warning=True, critical=False, target=["all"]
# ... )
# ```
