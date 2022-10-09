import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'authorization_status.dart';
import 'user_notifications_platform_interface.dart';

/// An implementation of [UserNotificationsPlatform] that uses method channels.
class MethodChannelUserNotifications extends UserNotificationsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('user_notifications');

  @override
  Future<AuthorizationStatus> authorizationStatus() async {
    final authorizationStatus = await methodChannel.invokeMethod<String>('authorizationStatus');
    switch (authorizationStatus) {
      case "notDetermined":
        return AuthorizationStatus.notDetermined;
      case "denied":
        return AuthorizationStatus.denied;
      case "authorized":
        return AuthorizationStatus.authorized;
      case "provisional":
        return AuthorizationStatus.provisional;
      case "ephemeral":
        return AuthorizationStatus.ephemeral;
      default:
        return AuthorizationStatus.unknown;
    }
  }

  @override
  Future<bool> requestAuthorization() async {
    final granted = await methodChannel.invokeMethod<bool>('requestAuthorization');
    return granted!;
  }

  @override
  Future<String?> deviceToken() async {
    final deviceToken = await methodChannel.invokeMethod<String>('deviceToken');
    return deviceToken;
  }
}
