import 'package:base_demo/common/logger.dart';
import 'package:base_demo/widgets/list_view_with_selectable_items.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  DialogPageState createState() => DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  String? selectedCity;
  final list = ['北京', '天津', '上海', '重庆', '深圳', '厦门'];

  Future<void> onShowTipsDialog(BuildContext context) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text("提示"),
            content: const Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(false), //关闭对话框
              ),
              TextButton(
                child: const Text("删除"),
                onPressed: () {
                  // ... 执行删除操作
                  Navigator.of(context).pop(true); //关闭对话框
                },
              ),
            ]);
      },
    );

    if (result != null) {
      if (result) {
        XLogger.getLogger().d('您点击了删除');
      } else {
        XLogger.getLogger().d('您点击了取消');
      }
    }
  }

  Future<void> onShowListDialog(BuildContext context) async {
    var list = ['北京', '天津', '上海', '重庆'];

    String? res = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('请选择以下城市'),
          content: SingleChildScrollView(
            child: ListBody(
              children: list.map((city) {
                return InkWell(
                  child: ListTile(
                    title: Text(city),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(city);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (res != null) {
      XLogger.getLogger().d(res);
    }
  }

  Future<void> onShowListViewDialog(BuildContext context) async {
    var list = ['北京', '天津', '上海', '重庆'];

    String? res = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('请选择以下城市'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(list.length, (index) {
                return ListTile(
                  title: Text(list[index]),
                  onTap: () {
                    Navigator.of(context).pop(list[index]);
                  },
                );
              }),
            ));
      },
    );

    if (res != null) {
      XLogger.getLogger().d(res);
    }
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: selectedCity == list[index] ? Colors.red : Colors.white,
                          child:  ListTile(
                          title: Text(
                            list[index],
                            textAlign: TextAlign.center,
                          ),
                        
                          onTap: () {
                            setState(() {
                              selectedCity = list[index];
                              XLogger.getLogger().d('您选择了$selectedCity');
                            });
                          },
                          tileColor: Colors.red
                        ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(selectedCity); // 关闭底部弹出的视图，并返回选择的选项
                          },
                          child: const Text('确定'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          XLogger.getLogger().d('您选择了$value');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  onShowTipsDialog(context);
                },
                child: const Text('普通对话框')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  onShowListDialog(context);
                },
                child: const Text('ListBody列表对话框')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  onShowListViewDialog(context);
                },
                child: const Text('ListView列表对话框')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  _showModalBottomSheet(context);
                },
                child: const Text('showModalBottomSheet底部菜单列表')
                ),

              const Expanded(
                child:  ListViewWithSelectableItems()
                )

          ],
        ),
      ),
    );
  }
}
