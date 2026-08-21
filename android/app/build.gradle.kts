plugins {
    id("com.android.application")

    // O plugin do Flutter deve ser aplicado depois do plugin Android.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.bombeiro_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        testInstrumentationRunner =
            "androidx.test.runner.AndroidJUnitRunner"

        applicationId = "com.example.bombeiro_app"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Adequado somente para testes.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    testImplementation("junit:junit:4.12")

    // https://developer.android.com/jetpack/androidx/releases/test/#1.2.0
    androidTestImplementation("androidx.test:runner:1.2.0")
    androidTestImplementation(
        "androidx.test.espresso:espresso-core:3.2.0"
    )
}