package app.illabo.yaw_phonenumber

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** YawPhonenumberPlugin */
class YawPhonenumberPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var yawp: YawPhonenumber

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    yawp = YawPhonenumber(flutterPluginBinding.applicationContext)
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "yaw_phonenumber")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    val arg: String? = call.argument("phone")
    if (arg == null) {
      result.error(
              "NOARG",
              "Missing argument",
              "Phone number string should be passed to all the calls"
      )
    }
    when (call.method){
      "formatIncomplete" -> result.success(yawp.formatIncomplete(arg!!))
      "formatAsInternational" -> result.success(yawp.formatAsInternational(arg!!))
      "isValidNumber" -> result.success(yawp.isValidNumber(arg!!))
      "isInternationallyDialable" -> result.success(yawp.isInternationallyDialable(arg!!))
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
