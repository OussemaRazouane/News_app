import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    var cont = WebViewController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web'),
        backgroundColor: const Color(0xAA51344d),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: cont.loadRequest(Uri.parse(url)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 81, 52, 77)),
              );
            } else {
              return WebViewWidget(controller: cont);
            }
          }),
    );
  }
}
