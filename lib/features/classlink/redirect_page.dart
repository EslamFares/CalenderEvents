import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/classlink/screens/home_screen.dart';
import 'package:flutter_application_1/utils/extentions/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RedirectPage extends StatefulWidget {
  final Uri authorizationUrl;
  final void Function(Uri redirectURL) onredirectAttep;
  const RedirectPage(
      {super.key,
      required this.authorizationUrl,
      required this.onredirectAttep});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  late SharedPreferences prefs;
  getToken() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            Logger("Started URL $url");
          },
          onPageFinished: (String url) {
            Logger("Finished URL $url", title: "inished URL###");
            Uri uri = Uri.parse(url);
            String? code = uri.queryParameters['code'];
            Logger("Code $code");

            if (code != null) {
              widget.onredirectAttep(uri);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClassLinkHomeScreen()));
            }
          },
          onWebResourceError: (WebResourceError error) {
            Logger("Error $error");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith('https://myapps.classlink.com/oauth?code')) {
              final responseUrl = Uri.parse(request.url);
              Logger("yyyyyyyyyy $responseUrl");
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;

            // return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(widget.authorizationUrl);
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
