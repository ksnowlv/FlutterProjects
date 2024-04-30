import 'package:base_demo/pages/mine/person/person_info.dart';

class PersonInfoController {
  late PersonInfo _model;

  PersonInfo get model => _model;

  PersonInfoController() {
    _model = PersonInfo('', 0);
  }

  void updateName(String name) {
    _model.name = name;
  }

  void decrement() {
    _model.age -= 1;
  }

  void increment() {
    _model.age += 1;
  }

  String personInfo () {
    return 'name: ${_model.name}, age: ${_model.age}';
  }

}
