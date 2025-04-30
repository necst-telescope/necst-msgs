# Data type for chopper control commands.

bool insert   # If ``True``, the absorber will cover the feed horn.
int64 position # Motoric position of the chopper, especially useful to control some slider-type motors
float64 time  # Time the command was sent.

# Examples
# --------
# >>> msg = ChopperMsg(insert=True, position=4750, time=time.time())
# >>> publisher.publish(msg)
