
import 'authorization_status.dart';
import 'user_notifications_platform_interface.dart';

class UserNotifications {
  Future<AuthorizationStatus> getAuthorizationStatus() {
    return UserNotificationsPlatform.instance.authorizationStatus();
  }

  Future<bool> requestAuthorization() {
    return UserNotificationsPlatform.instance.requestAuthorization();
  }

  Future<String?> getDeviceToken() {
    return UserNotificationsPlatform.instance.deviceToken();
  }
}
