import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt_lib;
import 'package:flutter/src/foundation/key.dart' as flutter_lib;

class AesPage extends StatefulWidget {
  final String title;
  const AesPage({super.key, required this.title});

  @override
  State<AesPage> createState() => _AesPageState();
}

class _AesPageState extends State<AesPage> {

  final sourceText = 'Hello World!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text('原始文本:$sourceText'),
              const SizedBox(height: 20,),

              ElevatedButton(onPressed: () {
                handleAESTest();
              }, child: const Text(' 测试AES加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('测试RSA解密')),
            ],
          ),
        ));
  }

  handleAESTest() {
    
    final key = encrypt_lib.Key.fromSecureRandom(32);
    final iv = encrypt_lib.IV.fromSecureRandom(16);
    final encrypter = encrypt_lib.Encrypter(encrypt_lib.AES(key));

    final encryptedResult = encrypter.encrypt(sourceText, iv: iv);
    debugPrint('encrypted bytes:${encryptedResult.bytes} \n base16 :${encryptedResult.base16} \nbase64 :${encryptedResult.base64}');
   
    
    final decryptedResult = encrypter.decrypt(encryptedResult, iv: iv);
    
    debugPrint('decrypted :$decryptedResult');
  }

  handleRSATest() {
    
  }
}
