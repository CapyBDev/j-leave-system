import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jleave_platform_interface.dart';

/// An implementation of [JleavePlatform] that uses method channels.
class MethodChannelJleave extends JleavePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jleave');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
