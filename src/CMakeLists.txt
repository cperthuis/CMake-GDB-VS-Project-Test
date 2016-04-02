cmake_minimum_required (VERSION 2.8) 
project (hello)

set (SRC
	helpers.h
	helpers.cpp
	main.cpp
)

add_executable(hello ${SRC})

get_filename_component(ROOT_PATH . ABSOLUTE)


#SET (NMAKE_PARAMS "$(RemoteHostName) $(RemoteUserName) \"$(PrivateKey)\" \"$(SecureShellExecutable)\" \"$(RemoteWorkingDirectory)\" \"$(RemoteExecutable)\"")

SET (NMAKE_PARAMS "$(RemoteHostName) $(RemoteUserName) \"$(PrivateKey)\" \"$(SecureShellExecutable)\" \"$(RemoteWorkingDirectory)\" \"$(RemoteExecutable)\" \"$(RemoteExecutableArguments)\"")

SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_BUILD "${ROOT_PATH}/build.bat release ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_REBUILD "${ROOT_PATH}/rebuild.bat release ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_CLEAN "${ROOT_PATH}/clean.bat release ${NMAKE_PARAMS}")

SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_BUILD_DEBUG "${ROOT_PATH}/build.bat debug ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_REBUILD_DEBUG "${ROOT_PATH}/rebuild.bat debug ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_CLEAN_DEBUG "${ROOT_PATH}/clean.bat debug ${NMAKE_PARAMS}")
