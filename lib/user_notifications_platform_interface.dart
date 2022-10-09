import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'authorization_status.dart';
import 'user_notifications_method_channel.dart';

abstract class UserNotificationsPlatform extends PlatformInterface {
  /// Constructs a UserNotificationsPlatform.
  UserNotificationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static UserNotificationsPlatform _instance = MethodChannelUserNotifications();

  /// The default instance of [UserNotificationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelUserNotifications].
  static UserNotificationsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UserNotificationsPlatform] when
  /// they register themselves.
  static set instance(UserNotificationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<AuthorizationStatus> authorizationStatus() {
    throw UnimplementedError('authorizationStatus() has not been implemented.');
  }

  Future<bool> requestAuthorization() {
    throw UnimplementedError(
        'requestAuthorization() has not been implemented.');
  }

  Future<String?> deviceToken() {
    throw UnimplementedError('deviceToken() has not been implemented.');
  }
}
