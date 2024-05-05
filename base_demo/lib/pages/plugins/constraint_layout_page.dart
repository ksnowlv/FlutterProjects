import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

class ConstraintLayoutPage extends StatefulWidget {
  final String title;

  const ConstraintLayoutPage({super.key, required this.title});

  @override
  State<ConstraintLayoutPage> createState() => _ConstraintLayoutPageState();
}

class _ConstraintLayoutPageState extends State<ConstraintLayoutPage> {
  final ConstraintId appLogoId = ConstraintId('appLogoId');
  final ConstraintId appTitleId = ConstraintId('appTitleId');
  final ConstraintId appAccountId = ConstraintId('appAccountId');
  final ConstraintId passwordId = ConstraintId('passwordId');
  final ConstraintId loginId = ConstraintId('loginId');
  final ConstraintId registId = ConstraintId('registId');
  final ConstraintId otherId = ConstraintId('otherId');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ConstraintLayout(
        children: <Widget>[
          _buildAppLogo(),
          _buildAppTitle(),
          _buildInputContainer(
            id: appAccountId,
            topConstraint: appTitleId.bottom.margin(40),
            hintText: '请输入账户名',
            icon: Icons.person,
          ),
          _buildInputContainer(
            id: passwordId,
            topConstraint: appAccountId.bottom.margin(20),
            hintText: '请输入密码',
            icon: Icons.password,
          ),
          _buildElevatedButton(
            id: loginId,
            topConstraint: passwordId.bottom.margin(70),
            buttonText: '登陆',
            backgroundColor: const Color(0xff5B70CF),
          ),
          _buildElevatedButton(
            id: registId,
            topConstraint: loginId.bottom.margin(30),
            buttonText: '注册',
            backgroundColor: const Color(0xffF8644E),
          ),
          _buildTextWithConstraints(
            id: otherId,
            text: '其他方式登录',
            topConstraint: registId.bottom.margin(60),
            centerHorizontalTo: parent,
          ),
          _buildSocialLoginRow(),
        ],
      ),
    );
    // // AppBar
  }
  // 构建logo
  Widget _buildAppLogo() {
    return Image.asset(
      'assets/images/login/app_logo.png',
      width: 120,
    ).applyConstraint(
      top: parent.top.margin(60),
      left: parent.left.margin(20),
      right: parent.right.margin(20),
      id: appLogoId,
    );
  }
  // 构建app的名称
  Widget _buildAppTitle() {
    return const Text(
      "APP Name",
      style: TextStyle(fontSize: 20, color: Color(0xFFBECEFA)),
    ).applyConstraint(
      id: appTitleId,
      top: appLogoId.bottom.margin(10),
      left: parent.left,
      right: parent.right,
    );
  }

  // 构建输入框:账号/密码
  Widget _buildInputContainer({
    required ConstraintId id,
    required ConstraintAlign topConstraint,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      color: const Color(0xFFF0F5FD),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(icon),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Color(0xffA0ACD4),
                fontSize: 20,
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
    ).applyConstraint(
      id: id,
      width: matchConstraint,
      height: 60,
      top: topConstraint,
      left: parent.left.margin(20),
      right: parent.right.margin(20),
    );
  }

  // 构建登陆/注册
  Widget _buildElevatedButton({
    required ConstraintId id,
    required ConstraintAlign topConstraint,
    required String buttonText,
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('点击了按钮:$buttonText');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ).applyConstraint(
      id: id,
      top: topConstraint,
      width: matchConstraint,
      height: 60,
      left: parent.left.margin(120),
      right: parent.right.margin(120),
    );
  }

  // 构造说明文本
  Widget _buildTextWithConstraints({
    required ConstraintId id,
    required String text,
    required ConstraintAlign topConstraint,
    required ConstraintId centerHorizontalTo,
  }) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFFD5DFF2),
      ),
    ).applyConstraint(
      id: id,
      left: parent.left,
      right: parent.right,
      top: topConstraint,
      centerHorizontalTo: centerHorizontalTo,
    );
  }
  // 构建其它登录方式：微信，QQ，微博
  Widget _buildSocialLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        const SizedBox(width: 20),
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
        const SizedBox(width: 20),
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
      ],
    ).applyConstraint(
      width: matchParent,
      top: otherId.bottom.margin(20),
    );
  }
}
