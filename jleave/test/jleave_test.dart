import 'package:flutter_test/flutter_test.dart';
import 'package:jleave/jleave.dart';
import 'package:jleave/jleave_platform_interface.dart';
import 'package:jleave/jleave_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJleavePlatform
    with MockPlatformInterfaceMixin
    implements JleavePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JleavePlatform initialPlatform = JleavePlatform.instance;

  test('$MethodChannelJleave is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJleave>());
  });

  test('getPlatformVersion', () async {
    Jleave jleavePlugin = Jleave();
    MockJleavePlatform fakePlatform = MockJleavePlatform();
    JleavePlatform.instance = fakePlatform;

    expect(await jleavePlugin.getPlatformVersion(), '42');
  });
}
