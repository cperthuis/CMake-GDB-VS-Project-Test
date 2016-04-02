CMake GDB VS Project Test
****

Introduction
============

This is a sample project to test out the addition of the GDB project type to
the Visual Studio Generator of CMake.

The CMake fork with GDB project support can be found here:
https://github.com/cperthuis/CMake

A binary release is also available: 
https://github.com/cperthuis/CMake/releases


Usage
============

The generator name is "Visual Studio 2015 GDB"

The following target properties have been added:

- VS_NMAKE_BUILD[_CONFIG]
- VS_NMAKE_REBUILD[_CONFIG]
- VS_CLEAN[_CONFIG]

Those can be set in a CMakeLists.txt like this:

```javascript
SET (NMAKE_PARAMS "$(RemoteHostName) $(RemoteUserName) \"$(PrivateKey)\" \"$(SecureShellExecutable)\" \"$(RemoteWorkingDirectory)\" \"$(RemoteExecutable)\" \"$(RemoteExecutableArguments)\"")

SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_BUILD "${ROOT_PATH}/build.bat release ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_REBUILD "${ROOT_PATH}/rebuild.bat release ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_CLEAN "${ROOT_PATH}/clean.bat release ${NMAKE_PARAMS}")

SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_BUILD_DEBUG "${ROOT_PATH}/build.bat debug ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_REBUILD_DEBUG "${ROOT_PATH}/rebuild.bat debug ${NMAKE_PARAMS}")
SET_PROPERTY(TARGET hello PROPERTY VS_NMAKE_CLEAN_DEBUG "${ROOT_PATH}/clean.bat debug ${NMAKE_PARAMS}")
```
