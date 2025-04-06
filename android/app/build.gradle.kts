plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.doula.doula"
    compileSdk = flutter.compileSdkVersion.toInt()
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true  // ← THIS IS CRUCIAL
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.doula.doula"
        minSdk = flutter.minSdkVersion.toInt()
        targetSdk = flutter.targetSdkVersion.toInt()
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Add the desugaring dependency (must match Android Gradle Plugin version)
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")  // ← REQUIRED
    
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.9.22")
}

flutter {
    source = "../.."
}