import 'package:base_demo/pages/mine/person/person_info_controller.dart';
import 'package:base_demo/pages/mine/person/person_info.dart';
import 'package:flutter/material.dart';

class PersonInfoView extends StatefulWidget {
  final PersonInfoController controller;

  const PersonInfoView({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _PersonInfoViewState();
}

class _PersonInfoViewState extends State<PersonInfoView> {
  late PersonInfoController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MVC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('personinfo = ${_controller.personInfo()}'),
              ElevatedButton(
                onPressed: () => setState(() {
                  _controller.updateName('ksnowlv');
                }),
                child: const Text('name ksnowlv'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _controller.increment();
                }),
                child: const Text('age Increment'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _controller.decrement();
                }),
                child: const Text('age decrement'),
              ),
            ],
          ),
        ));
  }
}
