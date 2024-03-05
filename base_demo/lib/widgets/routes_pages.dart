import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: const Text('Go to First Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Go to Third Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
              child: const Text('Go to fourth Screen'),
            ),
          
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('first screen '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text('back to last!')),
                const Text("first screen")
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('second screen '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text('back to last!')),
                const Text("second screen")
          ],
        ),
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget {

  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('third  screen '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text('back to last!')),
                const Text("third  screen")
          ],
        ),
      ),
    );
  }
}

