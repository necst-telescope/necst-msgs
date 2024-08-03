# Data type for Membrane control commands.

bool open   # If ``True``, the membrane open.
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = MembraneMsg(open=True, time=time.time())
# >>> publisher.publish(msg)
