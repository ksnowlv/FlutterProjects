import 'package:base_demo/dialogs/dialog_page.dart';
import 'package:base_demo/pages/functional/functional_page.dart';
import 'package:base_demo/pages/mine/value_listenable_builder_page.dart';
import 'package:flutter/material.dart';

class FunctionalContainerPage extends StatefulWidget {
  const FunctionalContainerPage({super.key});

  @override
  State<FunctionalContainerPage> createState() => _FunctionalContainerPageState();
}

class _FunctionalContainerPageState extends State<FunctionalContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('功能性组件'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: FunctionalPageType.values
            .map<Widget>((pageType) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: Text(_titleFromPageType(pageType)),
                        onPressed: () {
                          _showWidgetPage(context, pageType);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }


  String _titleFromPageType(FunctionalPageType pageType) {
    Map<FunctionalPageType, String> titleMap = {
      FunctionalPageType.popScope: '导航返回拦截',
      FunctionalPageType.inheritedWidget: '数据共享',
      FunctionalPageType.stateShared: '跨组件状态共享',
      FunctionalPageType.colorAndTheme: '颜色和主题',
      FunctionalPageType.valueListenableBuilder: '按需rebuild',
      FunctionalPageType.futureStreamBuilder: '异步UI更新',
      FunctionalPageType.dialog: '对话框',
    };

    return titleMap[pageType] ?? "没有该布局";
  }

  void _showWidgetPage(BuildContext context, FunctionalPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result = 
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (pageType == FunctionalPageType.valueListenableBuilder) {
              return const ValueListenableBuilderPage();
          } else if (pageType == FunctionalPageType.dialog) {
            return const DialogPage();
          }
      return FunctionalPage(
          pageType: pageType, pageTitle: _titleFromPageType(pageType));
    }
    ));

    debugPrint('result: $result');
  }
}
