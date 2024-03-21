import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;



class HiveManage {
  static HiveManage? _instance;
  // Avoid self instance
  HiveManage._();
  static HiveManage get instance => _instance ??= HiveManage._();

  static const String boxName = "base_demo";

  static init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path); // 初始化Hive，指定存储路径
    await Hive.openBox(boxName); // 打开名为'myBox'的数据盒子
  }


   static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }


}
