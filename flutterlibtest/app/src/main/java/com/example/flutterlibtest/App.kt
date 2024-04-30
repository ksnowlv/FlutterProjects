package com.example.flutterlibtest

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class App : Application() {
    companion object{
        const val flutterEngineId = "flutterEngineId"
    }

    lateinit var flutterEngine :FlutterEngine

    override fun onCreate() {
        super.onCreate()

        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        FlutterEngineCache.getInstance().put(flutterEngineId, flutterEngine)
    }
}