import 'package:base_demo/common/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  DialogPageState createState() => DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  String? selectedCity;
  final list = ['北京', '天津', '上海', '重庆', '深圳', '厦门'];

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

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
                          color: selectedCity == list[index]
                              ? Colors.red
                              : Colors.white,
                          child: ListTile(
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
                              tileColor: Colors.red),
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

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('正在加载，请稍候...'),
              )
            ],
          ),
          actions: [
            TextButton(onPressed: () {
                Navigator.of(context).pop();
            }, 
            child: const Text('取消'))
          ],
        );
      },
    );
  }

  Future<void> _showDatePicker() async {
    var date = DateTime.now();
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        const Duration(days: 30),
      ),
    );
    if (selectedDate != null) {
      XLogger.getLogger().d('您选择的日期是: $selectedDate');
      // 在这里可以对所选的日期进行需要的处理
    } else {
      // 用户取消了日期选择
      XLogger.getLogger().d('用户取消了日期选择');
    }
  }


  void _showDatePickeriOS() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('取消'),
                    onPressed: () {
                      XLogger.getLogger().d('用户取消了日期选择');
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('确认'),
                    onPressed: () {
                      // 在这里处理确认按钮的点击事件
                      // 例如，可以处理选中的日期
                      XLogger.getLogger().d('您选择的日期是: $_selectedDate');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  maximumDate: DateTime.now().add(const Duration(days: 30)),
                  minimumYear: 2010,
                  maximumYear: 2030,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                child: const Text('showModalBottomSheet底部菜单列表')),
            ElevatedButton(
                onPressed: () {
                  _showLoadingDialog(context);
                },
                child: const Text('Loading框')),
            ElevatedButton(
                onPressed: () {
                  _showDatePicker();
                },
                child: const Text('Material风格的日历选择器')),
            ElevatedButton(
                onPressed: () {
                  _showDatePickeriOS();
                },
                child: const Text('iOS风格的日历选择器')),
          ],
        ),
      ),
    );
  }
}
