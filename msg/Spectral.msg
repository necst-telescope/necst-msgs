# Data type for spectral data.

float32[] data        # The spectral data.
string<=8 position    # Observing position, such as ON, OFF, HOT, etc., up to 8 characters.
string<=16 id         # Coarse block / integration ID, up to 16 characters.
int32 line_index      # Fine line index inside a scan block, or -1 if N/A.
string<=64 line_label # Human-readable fine line label, empty if N/A.
float64 time          # Time the data is taken on.
string<=32 time_spectrometer # Time the data is taken from spectrometer, up to 32 characters.
int32[<=2] ch         # Stream range specification in spectrometer channel.
float64[<=2] rfreq    # Stream range specification in radio frequency.
float64[<=2] ifreq    # Stream range specification in intermediate frequency.
float64[<=2] vlsr     # Stream range specification in local standard of rest velocity.
float64 integ         # Integration time.
