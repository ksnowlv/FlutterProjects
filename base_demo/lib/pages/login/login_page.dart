import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60),
            Image.asset('assets/images/login/app_logo.png', width: 120),
            const SizedBox(height: 10),
            const Text(
              "测试APP",
              style: TextStyle(fontSize: 20, color: Color(0xFFBECEFA)),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: _buildTextField('请输入账户名', Icons.person),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: _buildTextField('请输入密码', Icons.password_rounded),
            ),
            const SizedBox(height: 40),
            _buildCustomButton('登陆', const Color(0xff5B70CF), () {
              debugPrint('点击了登陆按钮');
            }),
            _buildCustomButton('注册', const Color(0xffF8644E), () {
              debugPrint('点击了注册按钮');
            }),
            const SizedBox(height: 60),
            const Text(
              '其他方式登录',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFD5DFF2),
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  debugPrint('点击了微信登录');
                },
                child: Image.asset(
                  'assets/images/login/wechat.png',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  debugPrint('点击了QQ登录');
                },
                child: Image.asset(
                  'assets/images/login/qq.png',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  debugPrint('点击了微博登录');
                },
                child: Image.asset(
                  'assets/images/login/weibo.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData iconData) {
    return Container(
      height: 60,
      color: const Color(0xFFF0F5FD),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 10, right: 20),
            child: Icon(iconData),
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Color(0xffA0ACD4),
                 fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xffA0ACD4)),
                labelStyle: const TextStyle(color: Color(0xffA0ACD4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(
      String text, Color color, void Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(120, 30, 120, 0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
