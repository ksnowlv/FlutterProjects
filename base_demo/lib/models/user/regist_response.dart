  import 'package:base_demo/models/base_response.dart';

  // 定义注册数据的 model 类
class RegistData {
  final int registResult;
  final String userid;
  final String token;

  RegistData({required this.registResult, required this.userid, required this.token});

  factory RegistData.fromJson(Map<String, dynamic> json) {
    return RegistData(
      registResult: json['registResult'],
      userid: json['userid'],
      token: json['token'],
    );
  }
}

class RegistResponse extends BaseResponse {
    final RegistData data;

    RegistResponse({required int code, required String message, required this.data})
        : super(code: code, message: message);

    factory RegistResponse.fromJson(Map<String, dynamic> json) {
      return RegistResponse(
        code: json['code'],
        message: json['message'],
        data: RegistData.fromJson(json['data']),
      );
    }
  }