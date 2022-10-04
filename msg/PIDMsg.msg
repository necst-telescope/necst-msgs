# Data type for PID controller parameters.

float64 k_p  # Coefficient of the proportional term.
float64 k_i  # Coefficient of the integral term.
float64 k_d  # Coefficient of the derivative term.
string axis  # Identifier of controlling axis, which will be ``az`` or ``el``.

# ## Example
# ```python
# >>> from necst_msgs.msg import PIDMsg
# >>> msg = PIDMsg(k_p=2.0, k_i=0.0, k_d=0.0)
# ```
