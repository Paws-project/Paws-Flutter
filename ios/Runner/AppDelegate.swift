import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var controller: FlutterViewController?;
    var authChannel: FlutterMethodChannel?;
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    controller = window?.rootViewController as? FlutterViewController
    authChannel = FlutterMethodChannel(name: "auth_channel", binaryMessenger: controller!.binaryMessenger)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        authChannel?.invokeMethod("setToken", arguments: url.absoluteString)
        return true
    }
}
