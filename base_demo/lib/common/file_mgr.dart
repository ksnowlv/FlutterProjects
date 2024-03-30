import 'package:path_provider/path_provider.dart';

class FileMgr {
  static FileMgr? _instance;

  // 私有构造函数，避免外部实例化
  FileMgr._();

  // 获取单例实例
  static FileMgr get instance => _instance ??= FileMgr._();

  String? _documentsDirectory;

  Future<String> getDocumentsDirectory() async {
    _documentsDirectory ??= await _getApplicationDocumentsDirectory();
    return _documentsDirectory!;
  }

  Future<String> _getApplicationDocumentsDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
