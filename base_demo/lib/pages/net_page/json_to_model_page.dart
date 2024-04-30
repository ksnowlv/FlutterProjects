import 'dart:convert';

import 'package:base_demo/models/article_info.dart';
import 'package:base_demo/models/my_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonToModelPage extends StatefulWidget {
  const JsonToModelPage({super.key});

  @override
  State<JsonToModelPage> createState() => _JsonToModelPageState();
}

class _JsonToModelPageState extends State<JsonToModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('使用json_serializable'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _jsonWithJsonSerializable();
                },
                child: const Text('json转model/model转json'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('使用dart:convert'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _jsonWithDartConvert();
                },
                child: const Text('json转model/model转json'),
              ),
            ],
          ),
        ));
  }

  void _jsonWithJsonSerializable() async {
    try {
      // 加载本地 JSON 文件
      String data =
          await rootBundle.loadString('assets/json/article_info.json');
      Map<String, dynamic> jsonMap = json.decode(data);
      ArticleInfo articleInfo = ArticleInfo.fromJson(jsonMap);
      debugPrint('---jsonWithJsonSerializable:反序列化JSON---');
      debugPrint(
          '反序列化后articleInfo对象  { id :${articleInfo.article.id} title: ${articleInfo.article.title}}, content: ${articleInfo.article.content}  }');

      for (var comment in articleInfo.article.comments) {
        debugPrint(
            '反序列化后comment对象  { id :${comment.id} text: ${comment.text}}, author: ${comment.author.name}  }');
      }

      for (var tag in articleInfo.article.tags) {
        debugPrint('反序列化后tag对象  :$tag');
      }

      debugPrint('---jsonWithJsonSerializable:序列化对象articleInfo---');
      Map<String, dynamic> userJson = articleInfo.toJson();
      debugPrint('序列化后Json数据: ${json.encode(userJson)}');
    } catch (e) {
      debugPrint('JSON deserialization error:$e');
    }
  }

  void _jsonWithDartConvert() async {
    try {
      // 加载本地JSON文件
      String data = await rootBundle.loadString('assets/json/user_info.json');
      Map<String, dynamic> jsonMap = json.decode(data);
  
      MyUserInfo myUserInfo = MyUserInfo.fromJson(jsonMap);
      debugPrint('反序列化后 userInfo{ name :${myUserInfo.userInfo.name} age: ${myUserInfo.userInfo.age} address: ${myUserInfo.userInfo.address}  account :${myUserInfo.userInfo.account} ');
      
      for (var subscription in myUserInfo.subscriptions) {
        debugPrint('反序列化后subscription对象  { title :${subscription.title} subtitle: ${subscription.subtitle}}, content: ${subscription.content} likes: ${subscription.likes} }');
      }
      
      Map<String, dynamic> myUserJson = myUserInfo.toJson();
      debugPrint('序列化后Json数据: ${json.encode(myUserJson)}');
    } catch (e) {
      debugPrint('JSON deserialization error:$e');
    }
  }
}
