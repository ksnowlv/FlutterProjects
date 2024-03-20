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
    _loadData();
  }

  // 加载姓名
  _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _name = preferences.getString('name') ?? '';
      _password = preferences.getString('password') ?? '';

    });
  }

  // 保存姓名
  _saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('name', _name);
    await preferences.setString('password', _password);
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
          setState(() {
             _name = value;
             debugPrint(_name);
          });
         
        }),
        const SizedBox(
          height: 20,
        ),
        _buildInputRow('密码:', _passwordController, '请输入密码', (value) {
          setState(() {
              _password = value;
              debugPrint(_password);
          });
        
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
            _saveData();
          },
          child: const Text('保存姓名，密码'),
        ),
        const SizedBox(height: 16.0),
        Text('保存姓名为: $_name, 密码为: $_password'),
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
