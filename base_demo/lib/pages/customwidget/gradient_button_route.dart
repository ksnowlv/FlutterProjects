import 'package:base_demo/pages/customwidget/gradient_button.dart';
import 'package:flutter/material.dart';
    
class GradientButtonRoute extends StatefulWidget {
  const GradientButtonRoute({super.key});

  @override
  State<GradientButtonRoute> createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text('自定义按钮'),
        const SizedBox(height: 10,), 
        GradientButton(
          colors: const [Colors.orange, Colors.red],
          height: 50.0,
          onPressed: onTap,
          child: const Text("保存"),
        ),
        const SizedBox(height: 20,), 
        GradientButton(
          height: 50.0,
          colors: [Colors.lightGreen, Colors.green.shade700],
          onPressed: onTap,
          child: const Text("提交"),
        ),
        const SizedBox(height: 20,), 
        GradientButton(
          height: 50.0,
          //borderRadius: const BorderRadius.all(Radius.circular(5)),
          colors: [Colors.lightBlue.shade300, Colors.blueAccent],
          onPressed: onTap,
          child: const Text("登陆"),
        ),
      ],
    );
    
  }

   void onTap() {
    debugPrint("button click");
  }
}