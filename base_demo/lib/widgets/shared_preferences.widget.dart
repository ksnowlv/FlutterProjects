import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWidget extends StatefulWidget {
  const SharedPreferencesWidget({super.key});

  @override
  SharedPreferencesWidgetState createState() => SharedPreferencesWidgetState();
}

class SharedPreferencesWidgetState extends State<SharedPreferencesWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _name = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  // 加载已保存的文本
  _loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
    });
  }

  // 保存文本
  _saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    _loadSavedText(); // 保存完成后重新加载已保存的文本
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('shared preferences'),
        const SizedBox(
          height: 10,
        ),
        _buildInputRow('姓名:', _nameController, '请输入姓名', (value) {
          _name = value;
        }),
        const SizedBox(
          height: 20,
        ),
        _buildInputRow('密码:', _passwordController, '请输入密码', (value) {
          _password = value;
        }),
        const SizedBox(height: 10.0),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('登陆'),
              ),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            _saveText();
          },
          child: const Text('保存'),
        ),
        const SizedBox(height: 16.0),
        Text('保存 文本为: $_name'),
      ],
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller,
      String hint, Function(String) onChanged) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 40.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: hint,
                border: const OutlineInputBorder(),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
