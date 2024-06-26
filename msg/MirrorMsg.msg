# Data type for mirror control commands.

string position  # Position of M4.
float64 distance  # Move distance of M2.
int32[] status  # Position of M2.
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = MirrorMsg(position="IN", time=time.time())
# >>> publisher.publish(msg)