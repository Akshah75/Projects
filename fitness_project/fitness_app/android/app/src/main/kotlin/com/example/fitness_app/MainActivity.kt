package com.example.fitness_app
import androidx.annotation.NonNull
import io.flutter.plugins.GeneratedPluginRegistrant

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        
    }
  
}
