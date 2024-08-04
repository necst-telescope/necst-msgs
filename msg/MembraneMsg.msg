# Data type for Membrane control commands.

bool open   # If ``True``, the membrane open.
bool move   # If ``True``, the membrane is moving.
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = MembraneMsg(open=True, move=False, time=time.time())
# >>> publisher.publish(msg)
