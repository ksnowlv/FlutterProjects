import 'package:flutter/material.dart';

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class PersonNotifier extends ValueNotifier<Person> {
  PersonNotifier(super.value);
}

class ValueListenableBuilderPage extends StatefulWidget {
  const ValueListenableBuilderPage({super.key});

  @override
  State<ValueListenableBuilderPage> createState() =>
      _ValueListenableBuilderPageState();
}

class _ValueListenableBuilderPageState
    extends State<ValueListenableBuilderPage> {
  final PersonNotifier _person = PersonNotifier(Person('ksnowlv', 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder局部刷新'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _person,
              builder: (context, value, child) {
                return Text('name: ${value.name} age: ${value.age}');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _person.value =
                      Person(_person.value.name, _person.value.age + 1);
                },
                child: const Text('age + 1')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _person.value =
                      Person(_person.value.name, _person.value.age - 1);
                },
                child: const Text('age - 1')),
          ],
        ),
      ),
    );
  }
}
