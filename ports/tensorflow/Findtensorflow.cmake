function(_find_tensorflow)

  set(VCPKG_TARGET_TRIPLET_CONF release) #release/debug are symlinks to the same thing which is always release
  set(_tri ${VCPKG_TARGET_TRIPLET}-${VCPKG_TARGET_TRIPLET_CONF})
  set(_dir $ENV{P_project_output}/tensorflow/${_tri})

  # CMake find it
  set(tensorflow-cc_DIR ${_dir}/share/tensorflow-cc)
  set(tensorflow-cc_MAP_IMPORTED_CONFIG "RELWITHDEBINFO=release;MINSIZEREL=release")
  _find_package(tensorflow-cc CONFIG REQUIRED)

  # Create our virtual target if needed
  if(tensorflow_FOUND AND NOT TARGET tensorflow::tensorflow)
      add_library(tensorflow::tensorflow INTERFACE IMPORTED)
      target_link_libraries(tensorflow::tensorflow INTERFACE "${tensorflow_LIBS}")
  endif()

  set(tensorflow_DIR "${tensorflow-cc_DIR}" PARENT_SCOPE)
  set(tensorflow_FOUND "${tensorflow-cc_FOUND}" PARENT_SCOPE)
  set(tensorflow_VERSION "${tensorflow-cc_VERSION}" PARENT_SCOPE)

endfunction()
_find_tensorflow()
