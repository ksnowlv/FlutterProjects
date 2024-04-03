import 'package:base_demo/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  static const  String themeMode = 'theme_mode';

  late ThemeData _themeData;

  ThemeData get theme => _themeData;

  // 将构造函数改为工厂构造函数
  // 添加一个未命名的默认构造函数
  ThemeManager() {
    _themeData = AppTheme.lightTheme;
     loadTheme();
  }

  void switchTheme() {
    if (_themeData == AppTheme.lightTheme) {
      _themeData = AppTheme.darkTheme;
    } else if (_themeData == AppTheme.darkTheme) {
      _themeData = AppTheme.lightTheme;
    }
    saveTheme();

    notifyListeners();
  }

  Future<void> saveTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final int mode = _themeData.brightness == Brightness.dark ? 1 : 0;
    sharedPreferences.setInt(themeMode, mode);
    debugPrint('saveTheme mode:$mode');
  }

  Future<void> loadTheme() async {
    final sharedPreferences =  await SharedPreferences.getInstance();
    final int mode = sharedPreferences.getInt(themeMode) ?? 0;
     debugPrint('loadTheme mode:$mode');
    _themeData = mode == 1 ? AppTheme.darkTheme: AppTheme.lightTheme;
     notifyListeners();
  }
}
