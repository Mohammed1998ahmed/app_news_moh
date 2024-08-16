import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// import 'Widget';
class WabViewPage extends StatelessWidget {
  WabViewPage({
    Key? key,
    required this.Uri,
  }) : super(key: key);
  final String? Uri;
  @override
  Widget build(BuildContext context) {
    print("llllllllllllllllllllllllllllll");
    print(Uri.toString());
    return Scaffold(
      appBar: AppBar(),
      // body: WebViewWidget(

      //   initialUrl: Uri,
      // )
    );
  }
}
