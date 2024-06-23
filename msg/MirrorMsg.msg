# Data type for mirror control commands.

string position   # Position of mirror.
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = MirrorMsg(position="IN", time=time.time())
# >>> publisher.publish(msg)