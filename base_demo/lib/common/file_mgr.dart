import 'package:path_provider/path_provider.dart';

class FileMgr {
  FileMgr._privateConstructor();

  static final FileMgr instance = FileMgr._privateConstructor();

  String? _documentsDirectory;

  Future<String> getDocumentsDirectory() async {
   
    _documentsDirectory??=(await getApplicationDocumentsDirectory()).path;
    
    return _documentsDirectory!;
  }
}
