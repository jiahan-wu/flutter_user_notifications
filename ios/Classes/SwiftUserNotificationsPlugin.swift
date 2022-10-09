import Flutter
import UIKit

public class SwiftUserNotificationsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "user_notifications", binaryMessenger: registrar.messenger())
        let instance = SwiftUserNotificationsPlugin()
        registrar.addApplicationDelegate(instance)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "authorizationStatus":
            authorizationStatus(result: result)
        case "requestAuthorization":
            requestAuthorization(result: result)
        case "deviceToken":
            deviceToken(result: result)
        default:
            break
        }
    }
    
    private func authorizationStatus(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().getNotificationSettings { notificationSettings in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                result("notDetermined")
            case .denied:
                result("denied")
            case .authorized:
                result("authorized")
            case .provisional:
                result("provisional")
            case .ephemeral:
                result("ephemeral")
            @unknown default:
                result("unknown")
            }
        }
    }
    
    private func requestAuthorization(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            result(granted)
        }
    }
    
    private var deviceToken: String?
    
    private func deviceToken(result: @escaping FlutterResult) {
        result(deviceToken)
    }
    
    // MARK: - App Delegate
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any] = [:]) -> Bool {
        UIApplication.shared.registerForRemoteNotifications()
        return true
    }
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("") {
           return $0 + String(format: "%02x", $1)
        }
        self.deviceToken = deviceTokenString
    }
}
