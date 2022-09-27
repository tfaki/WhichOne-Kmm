buildscript {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-serialization:1.6.21")
    }
}

plugins {
    //trick: for the same plugin versions in all sub-modules
    id("com.android.application").version("8.0.0-alpha01").apply(false)
    id("com.android.library").version("8.0.0-alpha01").apply(false)
    kotlin("android").version("1.7.10").apply(false)
    kotlin("multiplatform").version("1.7.10").apply(false)
    id("com.google.dagger.hilt.android").version("2.41").apply(false)
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
