import 'package:flutter/material.dart';
import 'package:news_app_bloc/shared/widgets/back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: WebView(
                initialUrl: url,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: CustomBackButton()),
          ],
        ),
      ),
    );
  }
}
