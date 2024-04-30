import 'package:base_demo/pages/net_page/json_to_model_page.dart';
import 'package:flutter/material.dart';

enum NetPageType {
  jsonToModel, 

}
    
class NetContainerPage extends StatefulWidget {
  final String title;
  const NetContainerPage({super.key, required this.title});

  @override
  State<NetContainerPage> createState() => _NetContainerPageState();
}

class _NetContainerPageState extends State<NetContainerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemExtent: 60,
        padding: const EdgeInsets.all(20),
        itemCount: NetPageType.values.length,
        itemBuilder: (BuildContext context, int index) {
          final pageType = NetPageType.values[index];
          return _buildListItem(pageType, context);
        },
      ),
    );
  }

  Widget _buildListItem(NetPageType pageType, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(_titleFromPageType(pageType)),
          onPressed: () {
            _showWidgetPage(context, pageType);
          },
        ),
      ],
    );
  }

  String _titleFromPageType(NetPageType pageType) {
    Map<NetPageType, String> titleMap = {
      NetPageType.jsonToModel: 'json转模型',
   
    };

    return titleMap[pageType] ?? "没有该模块";
  }

   void _showWidgetPage(
      BuildContext context, NetPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _pageFromPageType(pageType);
    }));

    debugPrint('result: $result');
  }

  Widget _pageFromPageType(NetPageType pageType) {
    switch (pageType) {
      case NetPageType.jsonToModel:
        return const JsonToModelPage();
      default:
        return const SizedBox();
    }
  }
}