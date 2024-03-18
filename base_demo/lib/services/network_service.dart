import 'package:base_demo/models/user/regist_request.dart';
import 'package:base_demo/models/user/regist_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NetworkService {
  static final NetworkService _singleton = NetworkService._internal();

  factory NetworkService() {
    return _singleton;
  }

  NetworkService._internal();

  final Dio _dio = Dio();
  //     // 设置请求头
  // Map<String, String> headers = {
  //   "Content-Type": "multipart/form-data", // 设置Content-Type为application/json
  // };

  Map<String, String> jsonHeaders = {
    "Content-Type": "application/json",
    "Accept-Encoding": "gzip, deflate, br", // 设置Content-Type为application/json
  };

  void testGet() async {
    final response = await _dio.get('https://baidu.com');
    debugPrint("testGet:${response.toString()}");
  }

  void testHome() async {
    try {
      // 发起 GET 请求
      Response response = await _dio.get('http://127.0.0.1:8081/user/home');

      debugPrint(response.data.toString());
    } catch (e) {
      debugPrint('发生其他错误：$e');
    }
  }

  Future<RegistResponse?> testRegist() async {
    // 创建注册请求对象
    RegistRequest registRequest = RegistRequest(
      name: "ksnowlv",
      age: 10,
      phone: "15210795183",
      verificationCode: "123456",
    );

    try {
      Response response = await _dio.post(
        "http://127.0.0.1:8081/user/regist",
        data: registRequest.toJson(),
        options: Options(headers: jsonHeaders),
      );

      debugPrint("response data: ${response.data.toString()}");

      RegistResponse registResponse = RegistResponse.fromJson(response.data);
      return registResponse;
    } catch (e) {
      debugPrint("Error occurred: $e");
      return null;
    }
  }
}
