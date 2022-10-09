import 'package:flutter_test/flutter_test.dart';
import 'package:user_notifications/user_notifications.dart';
import 'package:user_notifications/user_notifications_platform_interface.dart';
import 'package:user_notifications/user_notifications_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUserNotificationsPlatform
    with MockPlatformInterfaceMixin
    implements UserNotificationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UserNotificationsPlatform initialPlatform = UserNotificationsPlatform.instance;

  test('$MethodChannelUserNotifications is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUserNotifications>());
  });

  test('getPlatformVersion', () async {
    UserNotifications userNotificationsPlugin = UserNotifications();
    MockUserNotificationsPlatform fakePlatform = MockUserNotificationsPlatform();
    UserNotificationsPlatform.instance = fakePlatform;

    expect(await userNotificationsPlugin.getPlatformVersion(), '42');
  });
}
