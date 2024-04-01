import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text('Hello TextAlign.left', textAlign: TextAlign.left),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child:
                    Text('Hello TextAlign.center', textAlign: TextAlign.center),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child:
                    Text('Hello TextAlign.right', textAlign: TextAlign.right),
              ),
            ],
          ),
          Text(
            'Hello ' * 16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            'Hello',
            textScaler: TextScaler.linear(3),
          ),
          Text(
            "Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          const Text.rich(
            TextSpan(
                text: 'Hello',
                style: TextStyle(color: Colors.blue),
                children: [
                  TextSpan(
                      text: 'wor',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple)),
                  TextSpan(
                      text: 'ld',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.red),
                  ),
                ]),
          ),
          RichText(
              text: const TextSpan(
                  text: 'Hello',
                  style: TextStyle(color: Colors.red),
                  children: [
                TextSpan(
                    text: ' world',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20))
              ])),
          const DefaultTextStyle(
              style: TextStyle(color: Colors.blue, fontSize: 20),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('hello world'),
                  Text('hello lucy'),
                  Text(
                    'hello ksnowlv',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              )),
          const Text(
              '使用自定义字体：Raleway-Light，Raleway-Regular,Raleway-Medium，Raleway-SemiBold, Raleway-Bold'),
          const Text(
            'hello world Raleway-Light',
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w300),
          ),
          const Text(
            'hello world ，Raleway-Regular',
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
          ),
          const Text(
            'hello world Raleway-Medium',
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w500),
          ),
          const Text(
            'hello world Raleway-SemiBold',
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w600),
          ),
          const Text(
            'hello world Raleway-Medium',
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
