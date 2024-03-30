/*
 * Copyright (c) 2018-2022 HERE Global B.V. and its affiliate(s).
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
import com.here.sdk.core.Color
import com.here.sdk.engine.InitProvider
import com.here.sdk.mapview.MapController
import com.here.sdk.mapview.MapView
import com.here.sdk.mapview.MapViewOptions
import com.here.sdk.mapview.MapProjection
import com.here.sdk.mapview.MapRenderMode
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class HereSdkPlugin() : HereSdkBasePlugin() {
    private var controllers : MutableList<MapController> = mutableListOf<MapController>()

    // Android embedding v1 implementation
    constructor(registrar: Registrar) : this() {
        this.registrar = registrar
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME)
            val hereSdkPlugin = HereSdkPlugin(registrar)

            channel.setMethodCallHandler(hereSdkPlugin)
            registrar.platformViewRegistry().registerViewFactory(METHOD_CHANNEL_NAME, hereSdkPlugin)
        }

        @JvmStatic
        private fun calculateOptions(args: Any?): MapViewOptions? {
            var options: MapViewOptions? = null
            if ( args != null &&
                 args is HashMap<*, *>){
                val projection = args.get("globeProjection") as? Boolean

                val red = (args.get("initialBackgroundRed") as? Double)?.toFloat()
                val green = (args.get("initialBackgroundGreen") as? Double)?.toFloat()
                val blue = (args.get("initialBackgroundBlue") as? Double)?.toFloat()
                val color = if(red != null && green != null && blue != null) Color.valueOf(red,green,blue) else null

                val useTextureRenderMode = args.get("textureRenderMode") as? Boolean

                if(projection == null && color == null && useTextureRenderMode == null) {
                    return null
                }

                options = MapViewOptions()

                if(projection != null) {
                    options.projection = if(projection == true) MapProjection.GLOBE else MapProjection.WEB_MERCATOR
                }

                options.initialBackgroundColor = color

                if(useTextureRenderMode != null) {
                    options.renderMode = if(useTextureRenderMode == true) MapRenderMode.TEXTURE else MapRenderMode.SURFACE
                }
            }
            return options
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        super.onAttachedToEngine(flutterPluginBinding)
        InitProvider.initialize(flutterPluginBinding.getApplicationContext())
    }

    fun removeMapController(controller : MapController) {
        controllers.remove(controller)
        if (activityBinding != null) {
            controller.detachActivity(activityBinding!!.getActivity())
        }
    }

    override fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) {
        super.onAttachedToActivity(binding)

        for (c in controllers) {
            c.attachActivity(activityBinding!!.getActivity())
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        for (c in controllers) {
            c.detachActivity(activityBinding!!.getActivity())
        }

        super.onDetachedFromActivityForConfigChanges()
    }

    override fun onReattachedToActivityForConfigChanges(@NonNull binding: ActivityPluginBinding) {
        super.onReattachedToActivityForConfigChanges(binding)

        for (c in controllers) {
            c.attachActivity(activityBinding!!.getActivity())
        }
     }

    override fun onDetachedFromActivity() {
        for (c in controllers) {
            c.detachActivity(activityBinding!!.getActivity())
        }

        super.onDetachedFromActivity()
    }

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val options = calculateOptions(args)
        val mapView = when (options) {
            null -> MapView(context);
            else -> MapView(context, options);
        }
        val controller = MapController(viewId, this, mapView)
        controllers.add(controller);
        return controller
    }
}
