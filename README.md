## Setup Instructions

### 1. Obtain a Google Maps API Key
To use Google Maps, you need an API key from the Google Cloud Platform:
1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new project or select an existing project.
3. Navigate to **APIs & Services > Credentials**.
4. Click on **Create credentials** and select **API key**.
5. Enable the following APIs for your project:
    - Maps SDK for Android
    - Maps SDK for iOS

### 2. Add API Key to Your Flutter Project

#### Android

1. Open your Flutter project and navigate to the `android/app/src/main/AndroidManifest.xml` file.
2. Add the following `<meta-data>` tag inside the `<application>` tag:

   ```xml
   <meta-data android:name="com.google.android.geo.API_KEY"
              android:value="<API KEY HERE>"/>
   ```
   Replace `<API KEY HERE>` with your actual Google Maps API key.

#### iOS

1. Open your Flutter project and navigate to the `ios/Runner/AppDelegate.swift` file.
2. Add the following code snippet inside the `application` method:

   ```swift
   import GoogleMaps

   @UIApplicationMain
   @objc class AppDelegate: FlutterAppDelegate {
     override func application(
       _ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
     ) -> Bool {
       GMSServices.provideAPIKey("<API KEY HERE>")
       GeneratedPluginRegistrant.register(with: self)
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
   }
   ```
   Replace `<API KEY HERE>` with your actual Google Maps API key.
