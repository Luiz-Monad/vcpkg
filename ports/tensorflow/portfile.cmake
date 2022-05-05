file(WRITE "${CURRENT_PACKAGES_DIR}/include/dummy.h" "")

file(COPY 
    ${CMAKE_CURRENT_LIST_DIR}/Findtensorflow.cmake 
    DESTINATION ${CURRENT_PACKAGES_DIR}/share)

file(
    INSTALL ${CMAKE_CURRENT_LIST_DIR}/copyright
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
    RENAME copyright
)
