import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ios_webview/webview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is ${kIsWeb ? 'Web' : 'App'} page'),
        ),
        body: const NumberList(),
      ),
    );
  }
}

class NumberList extends StatelessWidget {
  const NumberList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100, // 设置列表项的数量
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            if (kIsWeb) return;
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const WebViewPage(url: 'https://samaritan123.github.io/flutter_webview/'),
              ),
            );
          },
          title: Text('Item ${index + 1}'),
        );
      },
    );
  }
}
