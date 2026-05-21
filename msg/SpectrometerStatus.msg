# Lightweight spectrometer acquisition/recording status for progress/diagnostics.
#
# This message intentionally carries no spectral array payload. It reports only
# acquisition, queue, metadata, and recording-health information.

bool valid
bool recorder_active
bool saving_enabled
bool acquiring

float64 publish_time_unix
float64 last_dump_time_unix
float64 last_record_time_unix
float64 last_stream_time_unix
float64 last_dump_age_sec       # Age since local process received the latest complete dump [s].

string<=32 latest_time_spectrometer

int32 record_every_n
int32 data_queue_size_max
int32 n_streams
int32 n_boards
int32 missing_board_count

bool tp_mode
int32 tp_range_start
int32 tp_range_stop

int32 qlook_ch_start
int32 qlook_ch_stop

string<=8 metadata_position
string<=16 metadata_id
string<=64 section_kind
string<=64 section_label
int32 line_index

string<=128 recorder_path
string<=128 warning
