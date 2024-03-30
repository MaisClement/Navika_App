/*
 * Copyright (c) 2022 HERE Global B.V. and its affiliate(s).
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

import android.util.Log
import com.here.NativeBase
import com.here.sdk.mapview.MapView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.reflect.Field

/**
 * Establishes a communication channel with flutter to allow it to create a dart HereMapController
 * over a native MapView.
 *
 * @param id The flutter id of the MapView object.
 * @param messenger A flutter messenger through which the communication channel is established.
 * @param mapView The MapView object to map to the id.
 */
class MapViewHost(private val id: Int,
                  private val messenger: BinaryMessenger,
                  private val mapView: MapView) : MethodChannel.MethodCallHandler {

    init {
        // Channel name should match with the one used by HereMapController.
        val channel: MethodChannel = MethodChannel(messenger, "com.here.flutter/here_sdk_$id")
        channel.setMethodCallHandler(this)
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
            Log.e("HERE_SDK", "Internal error when trying to initialize map view host: ${t.message}", t)
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
}
