package shurgency.paws

import android.content.Context
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private lateinit var authChannel: MethodChannel;

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        authChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "auth_channel")
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        this.handleIntent(context, intent)
    }

    private fun handleIntent(context: Context, intent: Intent) {
        val action = intent.action
        val dataString = intent.dataString
        authChannel.invokeMethod("setToken", dataString)
    }
}
