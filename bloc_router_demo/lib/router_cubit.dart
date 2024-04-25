// 路由Cubit
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/*
 * RouterInfo 类用于存储路由信息。
 * 
 * @param route 可选参数，表示路由的路径。
 * @param params 可选参数，表示路由中携带的参数，以键值对形式存储。
 */
class RouterInfo {
  // 路由路径
  String? route;  
  // 路由参数
  Map<String, String>? params;

  /*
   * RouterInfo 类的构造函数。
   * 
   * @param route 路由路径，可以为空。
   * @param params 路由参数，以键值对形式存储，可以为空。
   */
  RouterInfo(this.route, this.params);
}


/*
 * 路由器状态管理器类，继承自Cubit，用于管理应用程序的路由信息。
 */
class RouterCubit extends Cubit<RouterInfo> {
   /*
   * 构造函数：初始化RouterCubit状态。
   */
  RouterCubit() : super(RouterInfo(null, null));

  /*
   * 导航到指定的路由页面，并带上参数。
   * 
   * @param route 要导航到的路由名称。
   * @param params 路由参数，以键值对形式提供。
   */
  void navigateTo(String route, Map<String, String> params) {

    debugPrint('HomeCubit :$route, params:$params');
    RouterInfo routerInfo = RouterInfo(route, params);
    emit(routerInfo);
  }
}
