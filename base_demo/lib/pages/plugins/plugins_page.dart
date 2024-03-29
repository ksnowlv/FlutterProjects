import 'package:base_demo/pages/plugins/video_player_page.dart';
import 'package:flutter/material.dart';

  enum PluginType {
  videoPlayer,//https://pub-web.flutter-io.cn/packages/video_player
  autoRoute,//https://pub-web.flutter-io.cn/packages/auto_route
  audioPlayers,//https://pub-web.flutter-io.cn/packages/audioplayers
  flutterAnimate,//https://pub-web.flutter-io.cn/packages/flutter_animate
  slidingUpPanel,//https://pub-web.flutter-io.cn/packages/sliding_up_panel
  localAuth,//https://pub-web.flutter-io.cn/packages/local_auth
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
    PluginType.autoRoute: '自动路由组件',
    PluginType.audioPlayers: '音频播放组件',
    PluginType.flutterAnimate: 'flutter动画组件',
    PluginType.slidingUpPanel: '滑动面板组件',
    PluginType.localAuth: '本地生物识别和设备密码验证组件',
   // PluginTypePage.fileWidget: '文件组件',
   // HomePageRouteType.netWidget: '网络组件',
   // HomePageRouteType.extensionWidget: '包和插件组件',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
      children: PluginType.values
          .map<Widget>((pageType) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _onShowPage(context, pageType),
                      child: Text(
                        _getPageTypeText(pageType),
                        style: const TextStyle(fontSize: 18),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))
          .toList(),
    )
    );
  }


  void _onShowPage(
      BuildContext context, PluginType pluginType) async {
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
        return VideoPlayerPage(pageTitle: _getPageTypeText(PluginType.videoPlayer));
      case PluginType.autoRoute:
        return const Text('2');

      case PluginType.audioPlayers:
        return const Text('');
      case PluginType.flutterAnimate:
        return const Text('3');

      case PluginType.slidingUpPanel:
        return const Text('4');
      case PluginType.localAuth:
        return const Text('5');

    
      default:
        return Text('没有该模块:$pluginType');
    }
  }


}