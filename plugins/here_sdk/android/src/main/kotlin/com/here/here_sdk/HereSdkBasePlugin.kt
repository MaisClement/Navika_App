/*
 * Copyright (c) 2018-2021 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 *
 * This software and other materials contain proprietary information
 * controlled by HERE and are protected by applicable copyright legislation.
 * Any use and utilization of this software and other materials and
 * disclosure to any third parties is conditional upon having a separate
 * agreement with HERE for the access, use, utilization or disclosure of this
 * software. In the absence of such agreement, the use of the software is not
 * allowed.
 */

package com.here.here_sdk

import android.content.Context
import android.os.Build
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

@RequiresApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
abstract class HereSdkBasePlugin() :
        FlutterPlugin,
        ActivityAware,
        PlatformViewFactory(StandardMessageCodec.INSTANCE),
        MethodChannel.MethodCallHandler {

    companion object {
        const val METHOD_CHANNEL_NAME = "com.here.flutter/here_sdk"
    }

    var registrar: Registrar? = null

    // Android embedding v2 implementation
    private lateinit var channel : MethodChannel
    var pluginBinding : FlutterPlugin.FlutterPluginBinding? = null
    var activityBinding : ActivityPluginBinding? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        pluginBinding = flutterPluginBinding
        channel = MethodChannel(pluginBinding!!.getBinaryMessenger(), METHOD_CHANNEL_NAME)
        channel.setMethodCallHandler(this)

        pluginBinding!!.getPlatformViewRegistry().registerViewFactory(METHOD_CHANNEL_NAME, this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        pluginBinding = null
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(@NonNull binding : ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(@NonNull binding : ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivity() {
        activityBinding = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        result.notImplemented()
    }
}
