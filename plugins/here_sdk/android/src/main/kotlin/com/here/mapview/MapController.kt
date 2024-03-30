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

package com.here.sdk.mapview

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.view.View
import android.util.Log
import com.here.NativeBase
import com.here.sdk.mapview.MapView
import com.here.here_sdk.HereSdkPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import java.lang.reflect.Field

class MapController(private val id: Int,
                    private val plugin: HereSdkPlugin,
                    private val mapView: MapView) : MethodChannel.MethodCallHandler, PlatformView,  Application.ActivityLifecycleCallbacks {

    private var activity : Activity? = null

    init {
        val channel: MethodChannel

        // If the plugin contains a reference to a registrar then the client is using Android embedding v1
        if (plugin.registrar != null) {
            channel = MethodChannel(plugin.registrar!!.messenger(), "com.here.flutter/here_sdk_$id")
        } else {
            channel = MethodChannel(plugin.pluginBinding!!.getBinaryMessenger(), "com.here.flutter/here_sdk_$id")
        }

        channel.setMethodCallHandler(this)
        mapView.onCreate(null)
        mapView.onResume()
        mapView.enableForceRedrawOnChange()

        if (plugin.registrar != null) {
            plugin.registrar!!.activity()?.application?.registerActivityLifecycleCallbacks(this)
        } else {
            // if already attached to activity, register
            activity = plugin.activityBinding?.getActivity()
            activity?.application?.registerActivityLifecycleCallbacks(this)
        }
    }

    fun attachActivity(activity : Activity) {
        // (re)create rendering surface
        mapView.createSurface()
        // resume render thread in case it was paused before we got detached
        mapView.onResume()

        // we might get this only after we were detached before and not initially
        this.activity = activity
        activity.application?.registerActivityLifecycleCallbacks(this)
    }

    fun detachActivity(activity : Activity) {
        this.activity = null
        activity.application?.unregisterActivityLifecycleCallbacks(this)

        // destroy rendering surface
        mapView.destroySurface()
    }

    fun getMapViewInternalPointer(): Long {
        var pointer: Long = 0;
        try {
            val mapviewInternalField: Field = mapView::class.java.getDeclaredField("mMapViewInternal")
            mapviewInternalField.isAccessible = true
            val mapViewInternal: NativeBase = mapviewInternalField.get(mapView) as NativeBase
            val nativeHandleField: Field = NativeBase::class.java.getDeclaredField("nativeHandle")
            nativeHandleField.isAccessible = true
            pointer = nativeHandleField.get(mapViewInternal) as Long;
        }
        catch (t: Throwable) {
            Log.e("HERE_SDK", "Internal error when trying to initialize map: ${t.message}", t)
            // just return 0
        }
        finally {
            return pointer;
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "initialize") {
            result.success(getMapViewInternalPointer());
        } else {
            result.notImplemented()
        }
    }

    override fun getView(): View {
        return mapView
    }

    override fun dispose() {
        mapView.onDestroy()

        if (plugin.registrar != null) {
            plugin.registrar!!.activity()?.application?.unregisterActivityLifecycleCallbacks(this)
        }

        plugin.removeMapController(this)
    }

    override fun onActivityPaused(activity: Activity) {
        if (activity == this.activity) {
            mapView.onPause()
        }
    }

    override fun onActivityResumed(activity: Activity) {
        if (activity == this.activity) {
            mapView.onResume()
        }
    }

    override fun onActivityStarted(activity: Activity) {
    }

    override fun onActivityDestroyed(activity: Activity) {
        // mapView.onDestroy() is called in dispose() already
    }

    override fun onActivitySaveInstanceState(activity: Activity, bundle: Bundle) {
        if (activity == this.activity) {
            mapView.onSaveInstanceState(bundle)
        }
    }

    override fun onActivityStopped(activity: Activity) {
    }

    override fun onActivityCreated(activity: Activity, bundle: Bundle?) {
        if (activity == this.activity) {
            mapView.onCreate(bundle)
        }
    }
}
