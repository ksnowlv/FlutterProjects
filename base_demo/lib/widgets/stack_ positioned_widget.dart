import 'package:flutter/material.dart';

class StackPositionedWidget extends StatelessWidget {
  const StackPositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Positioned(
            top: 10,
            child: Container(
              width: 50,
              height: 20,
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 10,
            child: Container(
              width: 10,
              height: 20,
              color: Colors.green,
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              width: 10,
              height: 20,
              color: Colors.cyan,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 10,
              height: 20,
              color: Colors.blue,
            ),
          ),
             Positioned(
            bottom: 10,
            left: 100,
            child: Container(
              width: 10,
              height: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
