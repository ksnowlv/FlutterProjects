import 'package:flutter/material.dart';

class FlexWidget extends StatelessWidget {
  const FlexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                height: 30,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                height: 30,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                height: 30,
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20, left: 0),
            child: SizedBox(
              height: 100,
              width: 300,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        color: Colors.purple,
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
