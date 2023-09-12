#  Interface definition for weather information.

float64 press # Atmospheric pressure, in hPa.
float64 InTemp # Indoor temperature, in K.
float64 InHum # Indooor relative humidity, between 0 and 1.
float64 OutTemp # Outdoor temperature, in K.
float64 OutHum # Outdoor relative humidity, between 0 and 1.
float64 WindSpeed # Windspeed, in m/sec.
float64 WindDir # WindDirection, in digrees between 0 and 360.
float64 RainRate # Rainrate, in mm
float64 time # Time the data were taken at.