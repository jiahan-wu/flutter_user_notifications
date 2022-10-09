import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_notifications/user_notifications_method_channel.dart';

void main() {
  MethodChannelUserNotifications platform = MethodChannelUserNotifications();
  const MethodChannel channel = MethodChannel('user_notifications');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
