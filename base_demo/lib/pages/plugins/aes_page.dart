import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt_lib;
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest();
                  },
                  child: const Text(' 测试AES AESMode.sic加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.cbc);
                  },
                  child: const Text(' 测试AES AESMode.cbc加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.cfb64);
                  },
                  child: const Text(' 测试AES AESMode.cfb64加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.ctr);
                  },
                  child: const Text(' 测试AES AESMode.ctr加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.ecb);
                  },
                  child: const Text(' 测试AES AESMode.ecb加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.ofb64Gctr);
                  },
                  child: const Text(' 测试AES AESMode.ofb64Gctr加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleAESTest(mode: encrypt_lib.AESMode.ofb64);
                  },
                  child: const Text(' 测试AES AESMode.ofb64加解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleRSATest();
                  },
                  child: const Text('测试RSA解密')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    handleRSASignTest();
                  },
                  child: const Text('测试RSA加签和验签')),
            ],
          ),
        ));
  }

// CBC AESMode.cbc
// CFB-64 AESMode.cfb64
// CTR AESMode.ctr
// ECB AESMode.ecb
// OFB-64/GCTR AESMode.ofb64Gctr
// OFB-64 AESMode.ofb64
// SIC AESMode.sic

  handleAESTest({encrypt_lib.AESMode mode = encrypt_lib.AESMode.sic}) {
    debugPrint('---- :$mode---');

    final key = encrypt_lib.Key.fromSecureRandom(32);
    final iv = encrypt_lib.IV.fromSecureRandom(16);
    final encrypter = encrypt_lib.Encrypter(encrypt_lib.AES(key, mode: mode));

    final encryptedResult = encrypter.encrypt(sourceText, iv: iv);
    debugPrint(
        'encrypted bytes:${encryptedResult.bytes} \n base16 :${encryptedResult.base16} \nbase64 :${encryptedResult.base64}');

    final decryptedResult = encrypter.decrypt(encryptedResult, iv: iv);

    debugPrint('decrypted :$decryptedResult');
  }

  handleRSATest() async {
    String publicKeyString =
        await rootBundle.loadString('assets/rsa/rsa_public_key.pem');
    String privateKeyString =
        await rootBundle.loadString('assets/rsa/rsa_private_key.pem');

    debugPrint(
        'publicKeyString:$publicKeyString \n privateKeyString:$privateKeyString');

    final parser = encrypt_lib.RSAKeyParser();
    final publicKey = parser.parse(publicKeyString) as RSAPublicKey;
    final privKey = parser.parse(privateKeyString) as RSAPrivateKey;

    // final publicKey = await parseKeyFromFile<RSAPublicKey>('rsa/rsa_public_key.pem');
    // final privKey = await parseKeyFromFile<RSAPrivateKey>('rsa/rsa_private_key.pem');

    encrypt_lib.Encrypter encrypter;
    encrypt_lib.Encrypted encrypted;
    String decrypted;

    // PKCS1 (Default)
    encrypter = encrypt_lib.Encrypter(
        encrypt_lib.RSA(publicKey: publicKey, privateKey: privKey));
    encrypted = encrypter.encrypt(sourceText);
    debugPrint(
        '\nPKCS1 (Default) encrypted ${encrypted} \n bytes:${encrypted.bytes} \n base16 :${encrypted.base16} \n base64 :${encrypted.base64}');

    decrypted = encrypter.decrypt(encrypted);

    debugPrint('PKCS1 (Default) decrypted :$decrypted');

    // OAEP (SHA1)
    encrypter = encrypt_lib.Encrypter(
      encrypt_lib.RSA(
          publicKey: publicKey,
          privateKey: privKey,
          encoding: encrypt_lib.RSAEncoding.OAEP),
    );
    encrypted = encrypter.encrypt(sourceText);

    debugPrint(
        '\nOAEP (SHA1) encrypted ${encrypted} \n bytes:${encrypted.bytes} \n base16 :${encrypted.base16} \n base64 :${encrypted.base64} ');

    decrypted = encrypter.decrypt(encrypted);

    debugPrint('OAEP (SHA1) decrypted :$decrypted');

    // OAEP (SHA256)
    encrypter = encrypt_lib.Encrypter(encrypt_lib.RSA(
      publicKey: publicKey,
      privateKey: privKey,
      encoding: encrypt_lib.RSAEncoding.OAEP,
      digest: encrypt_lib.RSADigest.SHA256,
    ));
    encrypted = encrypter.encrypt(sourceText);

    debugPrint(
        '\nOAEP (SHA256) encrypted ${encrypted} \n bytes:${encrypted.bytes} \n base16 :${encrypted.base16} \n base64 :${encrypted.base64} ');

    decrypted = encrypter.decrypt(encrypted);
    debugPrint('OAEP (SHA256) decrypted :$decrypted');
  }

  handleRSASignTest() async {
    String publicKeyString =
        await rootBundle.loadString('assets/rsa/rsa_public_key.pem');
    String privateKeyString =
        await rootBundle.loadString('assets/rsa/rsa_private_key.pem');

    debugPrint(
        'publicKeyString:$publicKeyString \n privateKeyString:$privateKeyString');

    final parser = encrypt_lib.RSAKeyParser();
    final publicKey = parser.parse(publicKeyString) as RSAPublicKey;
    final privateKey = parser.parse(privateKeyString) as RSAPrivateKey;
    final signer = encrypt_lib.Signer(encrypt_lib.RSASigner(
        encrypt_lib.RSASignDigest.SHA256,
        publicKey: publicKey,
        privateKey: privateKey));

    final signResult = signer.sign(sourceText);

    debugPrint(
        'signResult:$signResult,\n signResult base64 ${signResult.base64}');
    final verifyResult = signer.verify64(sourceText, signResult.base64);
    debugPrint('verifyResult:$verifyResult');
  }
}
