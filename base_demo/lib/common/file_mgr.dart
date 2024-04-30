import 'package:path_provider/path_provider.dart';

class FileMgr {
  FileMgr._privateConstructor();

  static final FileMgr instance = FileMgr._privateConstructor();
  //文档目录
  String? _documentsDirectory;
  //临时目录
  String? _temporaryDirectory;
  //
  String? _cacheDirectory;

  //获取文档目录
  Future<String> getDocumentsDirectory() async {
    _documentsDirectory ??= (await getApplicationDocumentsDirectory()).path;

    return _documentsDirectory!;
  }

//获取临时目录
  /// - `NSCachesDirectory` on iOS and macOS.
  /// - `Context.getCacheDir` on Android.
  Future<String> getTemporaryDirectoryPath() async {
    _temporaryDirectory ??= (await getTemporaryDirectory()).path;
    return _temporaryDirectory!;
  }

//获取缓存目录
  Future<String> getApplicationSupportDirectoryPath() async {
    _cacheDirectory ??= (await getApplicationSupportDirectory()).path;
    return _cacheDirectory!;
  }
}
