cmake_minimum_required(VERSION 3.8)
project(necst_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

set(msg_files
  "msg/AlertMsg.msg"
  "msg/Boolean.msg"
  "msg/Binning.msg"
  "msg/ChopperMsg.msg"
  "msg/Clock.msg"
  "msg/ControlStatus.msg"
  "msg/CoordMsg.msg"
  "msg/DeviceReading.msg"
  "msg/HEMTBias.msg"
  "msg/LocalAttenuatorMsg.msg"
  "msg/LocalSignal.msg"
  "msg/MembraneMsg.msg"
  "msg/MirrorMsg.msg"
  "msg/ObservingMode.msg"
  "msg/PIDMsg.msg"
  "msg/Sampling.msg"
  "msg/SISBias.msg"
  "msg/Spectral.msg"
  "msg/TimedAzElFloat64.msg"
  "msg/TimedAzElInt64.msg"
  "msg/TimedFloat64.msg"
  "msg/TrackingStatus.msg"
  "msg/WeatherMsg.msg"
  "msg/DomeCommand.msg"
  "msg/DomeStatus.msg"
  "msg/TimeOnly.msg"
)
set(srv_files
  "srv/AuthoritySrv.srv"
  "srv/CoordinateCommand.srv"
  "srv/File.srv"
  "srv/ObservationMode.srv"
  "srv/RecordSrv.srv"
  "srv/CCDCommand.srv"
  "srv/DomeSync.srv"
  "srv/DomeOC.srv"
  "srv/ComDelaySrv.srv"
  "srv/DomeLimit.srv"
)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  ${srv_files}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
