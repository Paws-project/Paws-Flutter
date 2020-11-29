import 'package:paws/config.dart';
import 'package:url_launcher/url_launcher.dart' as url;

/// Launches google authentication in webview sheet,
/// so it can be remotely closed afterwawrds.
///
/// Does nothing, if webview cannot be opened
void googleAuth() async {
  const host = "$API_HTTP/api/auth/google";
  if (await url.canLaunch(host)) {
    url.launch(
      host,
    );
  }
}
