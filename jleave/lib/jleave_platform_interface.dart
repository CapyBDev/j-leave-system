import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jleave_method_channel.dart';

abstract class JleavePlatform extends PlatformInterface {
  /// Constructs a JleavePlatform.
  JleavePlatform() : super(token: _token);

  static final Object _token = Object();

  static JleavePlatform _instance = MethodChannelJleave();

  /// The default instance of [JleavePlatform] to use.
  ///
  /// Defaults to [MethodChannelJleave].
  static JleavePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JleavePlatform] when
  /// they register themselves.
  static set instance(JleavePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
