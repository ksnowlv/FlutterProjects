import 'package:flutter/material.dart';

class RowColumnWidget extends StatelessWidget {
  const RowColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am snow "),
          ],
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" hello world "),
            Text(" I am snow "),
          ],
        ),
        
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: [
            Text(" hello world "),
            Text(" I am snow "),
          ],
        ), 

        const Row( 
          crossAxisAlignment: CrossAxisAlignment.start, 
          verticalDirection: VerticalDirection.up, 
          children: [
            Text(" hello world ", style: TextStyle(fontSize: 25),),
            Text(" I am snow "),
          ],
        ),

         Container(
          color: Colors.amber,
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            children: [ 
              Text("hello world"), 
              Text('I am snow'),
            ],
          ),
         ),
      ],
    );
  }
}
