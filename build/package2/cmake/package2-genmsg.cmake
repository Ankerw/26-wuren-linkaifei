# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "package2: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ipackage2:/home/anker/hw_ros_ws/src/package2/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(package2_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_custom_target(_package2_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "package2" "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(package2
  "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package2
)

### Generating Services

### Generating Module File
_generate_module_cpp(package2
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package2
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(package2_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(package2_generate_messages package2_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_dependencies(package2_generate_messages_cpp _package2_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package2_gencpp)
add_dependencies(package2_gencpp package2_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package2_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(package2
  "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package2
)

### Generating Services

### Generating Module File
_generate_module_eus(package2
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package2
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(package2_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(package2_generate_messages package2_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_dependencies(package2_generate_messages_eus _package2_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package2_geneus)
add_dependencies(package2_geneus package2_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package2_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(package2
  "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package2
)

### Generating Services

### Generating Module File
_generate_module_lisp(package2
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package2
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(package2_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(package2_generate_messages package2_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_dependencies(package2_generate_messages_lisp _package2_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package2_genlisp)
add_dependencies(package2_genlisp package2_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package2_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(package2
  "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package2
)

### Generating Services

### Generating Module File
_generate_module_nodejs(package2
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package2
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(package2_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(package2_generate_messages package2_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_dependencies(package2_generate_messages_nodejs _package2_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package2_gennodejs)
add_dependencies(package2_gennodejs package2_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package2_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(package2
  "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package2
)

### Generating Services

### Generating Module File
_generate_module_py(package2
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package2
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(package2_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(package2_generate_messages package2_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/anker/hw_ros_ws/src/package2/../msg/TurtleSpeed.msg" NAME_WE)
add_dependencies(package2_generate_messages_py _package2_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package2_genpy)
add_dependencies(package2_genpy package2_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package2_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package2
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(package2_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package2
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(package2_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package2
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(package2_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package2
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(package2_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package2)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package2\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package2
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(package2_generate_messages_py std_msgs_generate_messages_py)
endif()
