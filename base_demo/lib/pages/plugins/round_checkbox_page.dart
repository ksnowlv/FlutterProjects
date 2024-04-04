import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class RoundCheckboxPage extends StatelessWidget {
  static const double roundBoxSize = 50;

  const RoundCheckboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            RoundCheckBox(
              onTap: (selected) {},
              size: roundBoxSize,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              size: roundBoxSize,
              uncheckedColor: Colors.yellow,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              border: Border.all(
                width: 4,
                color: Colors.red,
              ),
              uncheckedColor: Colors.red,
              uncheckedWidget: const Icon(Icons.close, color: Colors.white),
              size: roundBoxSize,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              uncheckedWidget: const Icon(Icons.close),
              size: roundBoxSize,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              uncheckedWidget: const Icon(Icons.close),
              animationDuration: const Duration(
                milliseconds: 50,
              ),
              size: roundBoxSize,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              checkedWidget: const Icon(Icons.mood, color: Colors.white),
              uncheckedWidget: const Icon(Icons.mood_bad),
              animationDuration: const Duration(
                seconds: 1,
              ),
              size: roundBoxSize,
            ),
            const SizedBox(height: 10),
            RoundCheckBox(
              onTap: (selected) {},
              uncheckedWidget: const Icon(Icons.close),
              isChecked: true,
              size: roundBoxSize,
            ),
            const SizedBox(height: 12),
            RoundCheckBox(
              onTap: (selected) => debugPrint('RoundCheckBox $selected'),
              uncheckedWidget: const Icon(Icons.close),
              isChecked: true,
              size: roundBoxSize,
            ),
            const SizedBox(height: 12),
            const RoundCheckBox(
              onTap: null,
              uncheckedWidget: Icon(Icons.close),
              isChecked: true,
              size: roundBoxSize,
            ),
            const SizedBox(height: 12),
            RoundCheckBox(
              onTap: null,
              uncheckedWidget: const Icon(Icons.close),
              disabledColor: Colors.purple[300],
              isChecked: true,
              size: roundBoxSize,
            ),
          ],
        ),
      ),
    );
  }
}
