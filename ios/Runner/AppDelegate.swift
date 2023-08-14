import UIKit
import Flutter
import FirebaseMessaging
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
      var applicationLifeCycleChannel: FlutterBasicMessageChannel!

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

  
    GeneratedPluginRegistrant.register(with: self)
    // [GMSServices provideAPIKey:@"YOUR_API_KEY"];

    GMSServices.provideAPIKey("AIzaSyDXpn5SNY0N-vCcr_qqBXTaT_jPdCQuCwo")
    
    applicationLifeCycleChannel = FlutterBasicMessageChannel(
            name: "applicationLifeCycle",
            binaryMessenger: (window.rootViewController as! FlutterViewController).binaryMessenger,
            codec: FlutterStringCodec.sharedInstance())
            
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

      Messaging.messaging().apnsToken = deviceToken
      super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        applicationLifeCycleChannel.sendMessage("applicationWillTerminate")
    }

    override func applicationWillEnterForeground(_ application: UIApplication) {
        applicationLifeCycleChannel.sendMessage("applicationWillEnterForeground")
    }
     override func applicationDidEnterBackground(_ application: UIApplication) {
        applicationLifeCycleChannel.sendMessage("applicationDidEnterBackground")
    }
}
