import 'package:base_demo/pages/plugins/audio_players_page.dart';
import 'package:base_demo/pages/plugins/custom_popup_menu_page.dart';
import 'package:base_demo/pages/plugins/flutter_cache_manager_page.dart';
import 'package:base_demo/pages/plugins/image_compress_page.dart';
import 'package:base_demo/pages/plugins/round_checkbox_page.dart';
import 'package:base_demo/pages/plugins/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PluginType {
  videoPlayer, //https://pub-web.flutter-io.cn/packages/video_player
  imageCompress, //https://pub-web.flutter-io.cn/packages/flutter_image_compress
  autoRoute, //https://pub-web.flutter-io.cn/packages/auto_route
  audioPlayers, //https://pub-web.flutter-io.cn/packages/audioplayers
  flutterAnimate, //https://pub-web.flutter-io.cn/packages/flutter_animate
  slidingUpPanel, //https://pub-web.flutter-io.cn/packages/sliding_up_panel
  localAuth, //https://pub-web.flutter-io.cn/packages/local_auth
  roundcheckbox, //https://pub-web.flutter-io.cn/packages/roundcheckbox, 
  custom_pop_up_menu,//https://pub-web.flutter-io.cn/packages/custom_pop_up_menu
  flutter_cache_manager,//https://pub-web.flutter-io.cn/packages/flutter_cache_manager
}

class PluginsPage extends StatefulWidget {
  final String title;
  const PluginsPage({super.key, required this.title});

  @override
  State<PluginsPage> createState() => _PluginsPageState();
}

class _PluginsPageState extends State<PluginsPage> {
  final Map<PluginType, String> _pluginTypeMap = {
    PluginType.videoPlayer: '视频播放组件',
    PluginType.imageCompress: '图片压缩组件',
    PluginType.autoRoute: '自动路由组件',
    PluginType.audioPlayers: '音频播放组件',
    PluginType.flutterAnimate: 'flutter动画组件',
    PluginType.slidingUpPanel: '滑动面板组件',
    PluginType.localAuth: '本地生物识别和设备密码验证组件',
    PluginType.roundcheckbox: "roundcheckbox", 
    PluginType.custom_pop_up_menu: "自定义弹出菜单组件",
    PluginType.flutter_cache_manager: "flutter_cache_manager组件",
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PluginsPageCubit, String>(builder: (context, state) {

      if(state == 'videoplayer') {
        return VideoPlayerPage(pageTitle: "",);
      } else if (state == 'imagecompress') {
        return ImageCompressPage();
      } else if (state == 'audioplayers') {
        return AudioPlayersPage();
      } else if (state == 'roundcheckbox') {
        return RoundCheckboxPage();
      } else if (state == 'custom_pop_up_menu') {
        return CustomPopupMenuPage();
      } else if (state == 'flutter_cache_manager') {
        return const FlutterCacheManagerPage();
      }

      return _buildPluginsPages();
  
    } );
  }

  void _onShowPage(BuildContext context, PluginType pluginType) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => _getWidgetPage(pluginType)));
    debugPrint('result:$result');
  }

  String _getPageTypeText(PluginType pluginType) {
    return _pluginTypeMap[pluginType] ?? "没有该模块";
  }

  Widget _getWidgetPage(PluginType pluginType) {
    switch (pluginType) {
      case PluginType.videoPlayer:
        return VideoPlayerPage(
            pageTitle: _getPageTypeText(PluginType.videoPlayer));
      case PluginType.autoRoute:
        return const Text('2');

      case PluginType.imageCompress:
        return const ImageCompressPage();

      case PluginType.audioPlayers:
        return const AudioPlayersPage();

      case PluginType.flutterAnimate:
        return const Text('3');

      case PluginType.slidingUpPanel:
        return const Text('4');
      case PluginType.localAuth:
        return const Text('5');
      case PluginType.roundcheckbox:
        return const RoundCheckboxPage();
      case PluginType.custom_pop_up_menu:
        return const CustomPopupMenuPage();  
     case PluginType.flutter_cache_manager:
        return const FlutterCacheManagerPage();       

      default:
        return Text('没有该模块:$pluginType');
    }
  }

  Scaffold _buildPluginsPages() {
  return  Scaffold(
      body: ListView.builder(
        itemExtent: 60,
        itemCount: PluginType.values.length,
        itemBuilder: (BuildContext context, int index) {
          final pageType = PluginType.values[index];
          return   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _onShowPage(context, pageType),
                      child: Text(
                        _getPageTypeText(pageType),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
        },
      ),
    );
  }

  //并使用BlocBuilder来动态显示页面

}


// 首页模块的Cubit
class PluginsPageCubit extends Cubit<String> {
 PluginsPageCubit() :super('details');

 void navigateTo(String page) {
   emit(page);
 }
}
