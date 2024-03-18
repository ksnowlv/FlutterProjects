import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterInAppWebViewWidget extends StatefulWidget {
  final String url;

  const FlutterInAppWebViewWidget({super.key, required this.url});

  @override
  FlutterInAppWebViewWidgetState createState() =>
      FlutterInAppWebViewWidgetState();
}

class FlutterInAppWebViewWidgetState extends State<FlutterInAppWebViewWidget> {
  late InAppWebViewController _webViewController;
  String pageTitle = '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }

          if (await _webViewController.canGoBack()) {
            await _webViewController.goBack();
            updatePageTitle();
          } else {
            if (!context.mounted) {
              return;
            }
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(pageTitle),
            actions: [
              IconButton(
                  onPressed: () async {
                    if (await _webViewController.canGoBack()) {
                      await _webViewController.goBack();
                      updatePageTitle();
                    }
                  },
                  icon: const Icon(Icons.arrow_back)),
              IconButton(
                  onPressed: () async {
                    if (await _webViewController.canGoForward()) {
                      await _webViewController.goForward();
                    }
                  },
                  icon: const Icon(Icons.arrow_forward)),
              IconButton(
                  onPressed: () {
                    _webViewController.reload();
                    updatePageTitle();
                  },
                  icon: const Icon(Icons.refresh)),
            ],
          ),
          body: InAppWebView(
            initialUrlRequest:
                URLRequest(url: WebUri.uri(Uri.parse(widget.url))),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                debugPrint('Page started loading: $url');
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                debugPrint('Page onLoadStop loading: $url');
              });
            },
            onProgressChanged: (controller, progress) {
              debugPrint('Page onProgressChanged loading progress: $progress');
            },
            onPageCommitVisible: (controller, url) {
               debugPrint('Page onPageCommitVisible url: $url');
            },
            onTitleChanged: (controller, title) {
              debugPrint('Page onTitleChanged title: $title');
              setState(() {
                if (title != null) {
                  pageTitle = title;
                }
              });
            },
          ),
        ));
  }

  void updatePageTitle() {
    _webViewController.getTitle().then((value) {
      setState(() {
        if (value != null) {
          pageTitle = value;
        }
      });
    });
  }
}
