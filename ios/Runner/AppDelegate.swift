import UIKit
import Flutter
// <!-- Configuração pra Google Maps no IOS - Inicio  -->
import GoogleMaps
// <!-- Configuração pra Google Maps no IOS - Final  -->


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
// <!-- Configuração pra Google Maps no IOS - Inicio  -->
    GMSServices.provideAPIKey("AIzaSyCp2nFGjtl3EOJSgiFaUkp05dMEo2ZN1qY")
// <!-- Configuração pra Google Maps no IOS - Final  -->
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}