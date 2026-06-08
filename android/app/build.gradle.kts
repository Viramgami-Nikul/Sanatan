import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// Load keystore properties
val keystoreProperties = Properties().apply {
    val keystoreFile = rootProject.file("keystore/keystore.properties")
    if (keystoreFile.exists()) {
        load(FileInputStream(keystoreFile))
    }
}

// Load local properties
val localProperties = Properties().apply {
    val localPropertiesFile = rootProject.file("local.properties")
    if (localPropertiesFile.exists()) {
        localPropertiesFile.reader(Charsets.UTF_8).use {
            load(it)
        }
    }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode")?.toIntOrNull() ?: 1
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

android {
    namespace = "com.example.santvani_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    signingConfigs {
        create("SignConfig") {

            if (rootProject.file("keystore/keystore.properties").exists()) {

                storeFile = file(
                    keystoreProperties.getProperty("storeFile")
                )

                storePassword =
                    keystoreProperties.getProperty("storePassword")

                keyAlias =
                    keystoreProperties.getProperty("keyAlias")

                keyPassword =
                    keystoreProperties.getProperty("keyPassword")

                enableV1Signing = true
                enableV2Signing = true
                enableV3Signing = true
            }
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.santvani_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            // Release signing is selected per flavor.
        }
        getByName("debug") {
            // Don't use custom signing config for debug builds

        }
    }


    flavorDimensions += "app"
    productFlavors {
        create("prod") {
            dimension = "app"
            applicationId = "com.example.vpu"
            manifestPlaceholders["appName"] = "Vepar4u"
        }
        create("staging") {
            dimension = "app"
            applicationId = "com.example.santvani_app"
            manifestPlaceholders["appName"] = "Vepar4u Staging"
        }
    }
}

flutter {
    source = "../.."
}


dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:34.13.0"))


    // TODO: Add the dependencies for Firebase products you want to use
    // When using the BoM, don't specify versions in Firebase dependencies
    implementation("com.google.firebase:firebase-analytics")


    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
