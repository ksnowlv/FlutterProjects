import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
            onChanged: (value) {
              debugPrint('用户名: $value');
            },
            onEditingComplete: () {
              debugPrint('用户名: onEditingComplete');
            },
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
            onChanged: (value) {
              debugPrint('密码: $value');
            },
            onEditingComplete: () {
              debugPrint('密码: onEditingComplete');
            },
          ),
          Theme(
              data: Theme.of(context).copyWith(
                  hintColor: Colors.grey[200], //定义下划线颜色
                  inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                      )),
              child: const Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.0)),
                    obscureText: true,
                  )
                ],
              )),
          Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: const InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: const InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                // 登录按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("登录"),
                          ),
                          onPressed: () {
                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
