# Data type for mirror control commands.

bool in   # If ``True``, position of mirror is "IN".
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = MirrorMsg(in=True, time=time.time())
# >>> publisher.publish(msg)