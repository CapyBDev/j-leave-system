import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const JLeaveApp());
}

class JLeaveApp extends StatelessWidget {
  const JLeaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JLeaveWebView(),
    );
  }
}

class JLeaveWebView extends StatefulWidget {
  const JLeaveWebView({super.key});

  @override
  State<JLeaveWebView> createState() => _JLeaveWebViewState();
}

class _JLeaveWebViewState extends State<JLeaveWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("https://10.0.2.2:5000"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("J-Leave System"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
