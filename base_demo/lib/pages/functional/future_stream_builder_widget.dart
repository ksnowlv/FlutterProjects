import 'package:flutter/material.dart';

class FutureStreamBuilderWidget extends StatefulWidget {
  const FutureStreamBuilderWidget({super.key});

  @override
  State<FutureStreamBuilderWidget> createState() =>
      _FutureStreamBuilderWidgetState();
}

class _FutureStreamBuilderWidgetState extends State<FutureStreamBuilderWidget> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('---FutureBuilder---'),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              debugPrint('data waiting:${snapshot.data}');
              return CircularProgressIndicator(
                value: null, // 不确定的进度
                backgroundColor: Colors.blue,
                strokeWidth: 5.0,
                semanticsLabel: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Text('Error:${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Data:${snapshot.data}'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        
                      });
                    
                    },
                    child: const Text('FutureBuilder重新加载'), // 显示重新加载数据的按钮
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('---StreamBuilder---'),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<dynamic>(
          stream: combinedStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              debugPrint('data waiting:${snapshot.data}');

              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.hasData) {
                debugPrint('Data:${snapshot.data}');
                if (snapshot.data is String) {
                  result += '\n${snapshot.data as String}';
                } else if (snapshot.data is num) {
                  result += '\n${snapshot.data as num}';
                } else if (snapshot.data is bool) {
                  result += '\n 黑名单:${snapshot.data as bool}';
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('data:$result'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          
                        });
                      },
                      child: const Text('StreamBuilder重新加载~')),
                ],
              );
            }
          },
        ),
      ],
    ));
  }

  Future<String> fetchData() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 2), () {
        return "Hello,I am from FutureBuilder";
      });

      return future.toString();
    } catch (e) {
      debugPrint('fetchData error:$e');
      return '';
    }
  }

  Future<String> fetchUserInfo() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 2), () {
        return "Hello,I am from Stream fetchUserInfo ";
      });

      return future.toString();
    } catch (e) {
      debugPrint('fetchData error:$e');
      return '';
    }
  }

  Future<String> fetchUserOrders() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 4), () {
        return "Hello,I am from Stream fetchUserOrders";
      });

      return future.toString();
    } catch (e) {
      debugPrint('fetchData error:$e');
      return '';
    }
  }

  Future<String> fetchUserTicket() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 6), () {
        return "Hello,I am from Stream fetchUserTicket";
      });

      return future.toString();
    } catch (e) {
      debugPrint('fetchData error:$e');
      return '';
    }
  }

  Future<int> fetchUserCount() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 10), () {
        return 10;
      });

      return future.toInt();
    } catch (e) {
      debugPrint('fetchData error:$e');
      return -1;
    }
  }

  Future<bool> fetchUserIsInBlack() async {
    try {
      final future = await Future.delayed(const Duration(seconds: 12), () {
        return true;
      });

      return future;
    } catch (e) {
      debugPrint('fetchData error:$e');
      return false;
    }
  }

  Stream<dynamic> combinedStream() {
    return Stream<dynamic>.fromFutures([
      fetchUserInfo(),
      fetchUserOrders(),
      fetchUserTicket(),
      fetchUserCount(),
      fetchUserIsInBlack(),
    ]);
  }
}
