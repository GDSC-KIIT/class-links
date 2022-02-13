import 'dart:io';

bool isFirebaseUnSupportedPlatform() {
  return Platform.isWindows || Platform.isLinux;
}
