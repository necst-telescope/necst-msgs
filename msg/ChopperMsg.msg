# Data type for chopper control commands.

bool insert   # If ``True``, the absorber will cover the feed horn.
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = ChopperMsg(insert=True, time=time.time())
# >>> publisher.publish(msg)
