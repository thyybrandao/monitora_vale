import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class WebDecreto extends StatefulWidget {

  final String url;
  final String data;
  final String edicao;

  WebDecreto({Key key, this.url, this.data, this.edicao});

  @override
  _WebDecretoState createState() => _WebDecretoState();
}

class _WebDecretoState extends State<WebDecreto> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data + "-" + widget.edicao),
        centerTitle: true,
      ),
      body: SimplePdfViewerWidget(
          completeCallback: (bool result){
            return false;
          },
          initialUrl: widget.url,
        ),
    );                     
  }
}