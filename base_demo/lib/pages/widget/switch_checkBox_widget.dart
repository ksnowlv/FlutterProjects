import 'package:flutter/material.dart';

class SwitchCheckBoxWidget extends StatefulWidget {
  const SwitchCheckBoxWidget({super.key});

  @override
  State<SwitchCheckBoxWidget> createState() => _SwitchCheckBoxWidgetState();
}

class _SwitchCheckBoxWidgetState extends State<SwitchCheckBoxWidget> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;
  int _radioIndex = 1;
  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            // This bool value toggles the switch.
            value: _switchSelected,
            activeColor: Colors.red,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            activeColor: Colors.red,
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('CheckboxListTile'),
            subtitle: const Text('Subtitle'),
            secondary: const Icon(Icons.archive),
            activeColor: Colors.blue,
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            },
          ),
          Radio(
            value: 1,
            groupValue: _radioIndex,
            onChanged: (value) {
              setState(() {
                _radioIndex = value!;
              });
            },
          ),
          Radio(
            value: 2,
            groupValue: _radioIndex,
            onChanged: (value) {
              setState(() {
                _radioIndex = value!;
              });
            },
          ),
          Radio(
            value: 3,
            groupValue: _radioIndex,
            onChanged: (value) {
              setState(() {
                _radioIndex = value!;
              });
            },
          ),

           RadioListTile<String>(
         title:const Text('选项1'),
         value:'Option 1',
         groupValue:selectedValue,
         onChanged:(value) {
           setState(() {
             selectedValue = value!;
           });
         },
       ),
       RadioListTile<String>(
         title:const Text('选项2'),
         value:'Option 2',
         groupValue:selectedValue,
         onChanged:(value) {
           setState(() {
             selectedValue = value!;
           });
         },
       ),
       RadioListTile<String>(
         title:const Text('选项3'),
         value:'Option 3',
         groupValue:selectedValue,
         onChanged:(value) {
           setState(() {
             selectedValue = value!;
           });
         },
       ),
        ],
      ),
    );
  }
}
