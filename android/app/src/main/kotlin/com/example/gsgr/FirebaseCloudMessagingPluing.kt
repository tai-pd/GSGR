package com.example.gsgr

import io.flutter.plugin.common.PluginRegistry

object FirebaseCloudMessagingPluing {
    fun registerWith(pluginRegistry: PluginRegistry ) {
        if(alreadyRegisterWidth(pluginRegistry)) return
        registerWith(pluginRegistry)
    }

    private fun alreadyRegisterWidth(pluginRegistry: PluginRegistry): Boolean {
var key = FirebaseCloudMessagingPluing:: class.java.canonicalName
        if(pluginRegistry.hasPlugin(key)) return true
        pluginRegistry.registrarFor(key)
        return false

    }
}