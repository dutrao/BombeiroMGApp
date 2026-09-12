import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")

    // O plugin do Flutter deve ser aplicado depois do plugin Android.
    id("dev.flutter.flutter-gradle-plugin")

    id("com.google.gms.google-services")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

// Carrega as propriedades de assinatura somente se o arquivo existir.
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {

    namespace = "br.com.bombeiro_app"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    // Cria a configuração de release somente quando
    // o key.properties estiver disponível.
    signingConfigs {
        if (keystorePropertiesFile.exists()) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        testInstrumentationRunner =
            "androidx.test.runner.AndroidJUnitRunner"

        applicationId = "br.com.bombeiro_app"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {

        // Debug continua funcionando normalmente mesmo sem key.properties.
        debug {
            // Usa assinatura padrão de debug do Android.
        }

        release {
            // Só usa a assinatura de produção se o key.properties existir.
            if (keystorePropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
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

    androidTestImplementation("androidx.test:runner:1.2.0")

    androidTestImplementation(
        "androidx.test.espresso:espresso-core:3.2.0"
    )
}