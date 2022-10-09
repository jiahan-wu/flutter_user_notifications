#import "UserNotificationsPlugin.h"
#if __has_include(<user_notifications/user_notifications-Swift.h>)
#import <user_notifications/user_notifications-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "user_notifications-Swift.h"
#endif

@implementation UserNotificationsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUserNotificationsPlugin registerWithRegistrar:registrar];
}
@end
