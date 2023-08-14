package com.example.gsgr

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant.registerWith
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService

class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
//        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
    }

    override fun registerWith(registry: PluginRegistry?) {
         FirebaseCloudMessagingPluing.registerWith(registry!!)
    }

}