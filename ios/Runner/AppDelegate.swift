import UIKit
import Flutter
import GoogleMaps // Add this import statement

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Register your Flutter plugins
    GeneratedPluginRegistrant.register(with: self)

    // Set your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDRAF2I7EknpWWsN6k3Ir4HgpyLxwa-5Iw")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
