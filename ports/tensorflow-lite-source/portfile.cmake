
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO https://github.com/Luiz-Monad/tensorflow
    REF master
    SHA512 892ffbc922e31be803e4182b39fb9e647c9d796f
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH}/lite)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/lite
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

vcpkg_copy_pdbs()

file(
    INSTALL ${CMAKE_CURRENT_LIST_DIR}/LICENSE
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
    RENAME copyright
)
