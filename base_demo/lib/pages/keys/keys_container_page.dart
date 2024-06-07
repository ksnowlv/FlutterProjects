import 'package:base_demo/pages/keys/objectkey_page.dart';
import 'package:base_demo/pages/keys/uniquekey_page.dart';
import 'package:base_demo/pages/keys/valuekey_page.dart';
import 'package:flutter/material.dart';


// key页面类型
enum KeyPageType {
  uniqueKey, //UniqueKey
  valueKey, //ValueKey
  objectKey, //ObjectKey
  pageStorageKey, //PageStorageKey
  globalKey, //GlobalKey
}

class KeysContainerPage extends StatefulWidget {
  final String title;
  const KeysContainerPage({super.key, required this.title});

  @override
  State<KeysContainerPage> createState() => _KeysContainerPageState();
}

class _KeysContainerPageState extends State<KeysContainerPage> {
  final Map<KeyPageType, String> _titleMap = {
    KeyPageType.uniqueKey: 'UniqueKey',
    KeyPageType.valueKey: 'ValueKey',
    KeyPageType.objectKey: 'ObjectKey',
    KeyPageType.pageStorageKey: 'PageStorageKey',
    KeyPageType.globalKey: 'GlobalKey',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemExtent: 60,
          padding: const EdgeInsets.all(20.0),
          itemCount: KeyPageType.values.length ,
          itemBuilder: (BuildContext context, int index) { 
            final pageType = KeyPageType.values[index];
            return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showKeyPage(context, pageType),
                      child: Text(
                        _getPageTypeText(pageType),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );

           }, 
        ),
      ),
    );
  }

  String _getPageTypeText(KeyPageType pageType) {
    return _titleMap[pageType] ?? "没有该布局";
  }

  void _showKeyPage(BuildContext context, KeyPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => _widgetFromType(
                  pageType,

                )));

    debugPrint('result: $result');
  }
}

  Widget _widgetFromType(KeyPageType pageType) {
    switch (pageType) {
      case KeyPageType.uniqueKey:
        return const UniqueKeyPage();

      case KeyPageType.valueKey:
        return const ValuekeyPage();

      case KeyPageType.objectKey:
        return const ObjectkeyPage();

      case KeyPageType.pageStorageKey:
        return const UniqueKeyPage();

      case KeyPageType.globalKey:
        return const UniqueKeyPage();


      default:
        return const Text('没有该页面');
    }
  }
