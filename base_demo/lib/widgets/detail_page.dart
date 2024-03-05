import 'package:flutter/material.dart';
    
class DetailPage extends StatelessWidget {

 final String data;

const DetailPage({ super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pages'),
      ),
      body: Center(
        child: Column(

         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          const Text('received data'),
          Text(data),
          ElevatedButton(
            onPressed: () {

              Navigator.pop(context);

            } , 
            child: const Text('go back'))
         ],   
        ),
      ),
    );
  }
}