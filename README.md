# Great Places
Dependências usadas no projeto:
	image_picker: ^1.0.7
	path_provider: ^2.1.2
	path: ^1.8.3
	sqflite: ^2.3.1
	location: ^5.0.3
	google_maps_flutter: ^2.5.3


- ImagePicker vai abrir a camera
- PathProvider vai pegar o diretorio do sistema da aplicação
- Path vai criar um path pra salvar os arquivos na aplicação no diretório do app
- Sqflite é o Sqlite para o flutter
- Location vai pegar a localização do dispositivo
- Google Maps vai abrir o google maps no dispositivo pra pegar o local no mapa


## --- Configurações no ImagePicker ---
### ImagePicker no IOS:
Abrir o Info.plist na pasta IOS e adicionar:

<!-- Configuração pra camera no IOS - Inicio -->
	<key>NSCameraUsageDescription</key>
	<string>Precisamos tirar uma foto</string>
	<key>NSPhotoLibraryUsageDescription </key>
	<string>Precisamos tirar uma foto</string>
<!-- Configuração pra camera no IOS - Final -->

## --- Configurações no Location ---
### Location no ANDROID:
Abrir o AndroidManifest.xml da pasta main e adicionar:
<!-- Configuração pra localização no ANDROID - Inicio  -->
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
<!-- Configuração pra localização no ANDROID - Final  -->
Após isso, pode ser que precise atualizar o arquivo build.gradle da pasta android: Na data de 27.01 a versão mais recente é 1.9.22
	buildscript {
		// Alterado versão pra usar o location - Inicio
		ext.kotlin_version = '1.9.22'
		// Alterado versão pra usar o location - Final
		repositories {
			google()
			mavenCentral()
		}

		dependencies {
			classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
		}
	}


Após isso, deverá rodar o comando `flutter pub upgrade` para poder atualizar a versão do flutter com a nova do graddle

Mensagem do erro que apareceu aqui que sumiu depois de fazer isso acima:
┌─ Flutter Fix ──────────────────────────────────────────────────────────────────────────────┐
│ [!] Your project requires a newer version of the Kotlin Gradle plugin.                     │
│ Find the latest version on https://kotlinlang.org/docs/releases.html#release-details, then │
│ update C:\Users\jonas\Documents\Programas\FLUTTER\great_places\android\build.gradle:       │
│ ext.kotlin_version = '<latest-version>'                                                    │
└────────────────────────────────────────────────────────────────────────────────────────────┘



### Location no IOS:
Abrir o Info.plist na pasta IOS e adicionar:

<!-- Configuração pra localização no IOS - Inicio -->
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>Precisamos da sua localização</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription </key>
	<string>Precisamos da sua localização</string>
<!-- Configuração pra localização no IOS - Final -->

## --- Configurações no Google Maps ---
### Google Maps no Android:
Adicionar no build.gradle da pasta app (linha 48 normalmente):
	android {
		defaultConfig {
			minSdkVersion 20
		}
	}
Abrir o AndroidManifest.xml da pasta main e adicionar dentro de <aplication>:
<!-- Configuração pra Google Maps no ANDROID - Inicio  -->
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="AIzaSyCp2nFGjtl3fdsafadshaFaUkp05dMEo2ZN1qY"/>
<!-- Configuração pra Google Maps no ANDROID - Final  -->

Após isso, deverá rodar o comando `flutter pub upgrade` para poder atualizar a versão do flutter com a nova do graddle



### Google Maps no IOS:
Abrir o AppDelefate.swift dentro de ios runner e adicionar as partes comentadas:

	import UIKit
	import Flutter
	<!-- Configuração pra Google Maps no IOS - Inicio  -->
	import GoogleMaps
	<!-- Configuração pra Google Maps no IOS - Final  -->


	@UIApplicationMain
	@objc class AppDelegate: FlutterAppDelegate {
	override func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
	<!-- Configuração pra Google Maps no IOS - Inicio  -->
		GMSServices.provideAPIKey("AIzaSyCp2nFGjtl3EOJSgiFaUkp05dMEo2ZN1qY")
	<!-- Configuração pra Google Maps no IOS - Final  -->
		GeneratedPluginRegistrant.register(with: self)
		return super.application(application, didFinishLaunchingWithOptions: launchOptions)
	}
	}
