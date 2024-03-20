import 'package:flutter/material.dart';

class AlignWidegt extends StatelessWidget {
  const AlignWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.blue,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.blue,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.blue,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.green,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.green,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 50,
            height: 30,
            color: Colors.green,
          ),
        ),
        Container(
          height: 50.0,
          width: 100.0,
          color: Colors.blue[50],
          child: const Align(
            alignment: FractionalOffset(0.2, 1.0),
            child: FlutterLogo(
              size: 30,
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Text("hello world!"),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text("hello world!"),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.blue, // 背景颜色
            border: Border.all(color: Colors.red, width: 2.0), // 边框
            borderRadius: BorderRadius.circular(10.0), // 圆角
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ], // 阴影
          ),
          child: const SizedBox(
            height: 40,
            child: Center(
              child: Text('DecoratedBox Example',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
