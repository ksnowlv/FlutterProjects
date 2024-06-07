import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

// SHA-1
// SHA-224
// SHA-256
// SHA-384
// SHA-512
// SHA-512/224
// SHA-512/256
// MD5
enum CryptoType {
  sha1,
  sha224,
  sha256,
  sha384,
  sha512,
  sha512_224,
  sha512_256,
  md5,
  hmac224,
  hmac256,
  hmac384,
  hmac512,
  hmac512_224,
  hmac512_256,
  hmacmd5, // (i.e. HMAC-MD5, HMAC-SHA1, HMAC-SHA256)
}

class CryptoPage extends StatefulWidget {
  final String title;

  const CryptoPage({super.key, required this.title});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  static final hmacKey = utf8.encode('test_p@assw0rd1_hamc');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: _buildButtons(),
            ),
          ),
        ));
  }

  List<Widget> _buildButtons() {
    List<CryptoType> types = CryptoType.values;
    return types.map((type) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ElevatedButton(
          onPressed: () => _hashString('hello world', type),
          child: Text(_getButtonLabel(type)),
        ),
      );
    }).toList();
  }

  String _getButtonLabel(CryptoType type) {
    return type.toString().split('.').last; // 获取枚举项的字符串形式
  }

  String _hashString(String text, CryptoType type) {
    if (text.isEmpty) {
      return '';
    }
    var bytes = utf8.encode(text); // data being hashed

    var convert;

    switch (type) {
      case CryptoType.sha1:
        convert = sha1;
        break;
      case CryptoType.sha224:
        convert = sha224;
        break;
      case CryptoType.sha256:
        convert = sha256;
        break;

      case CryptoType.sha384:
        convert = sha384;
        break;

      case CryptoType.sha512:
        convert = sha512;
        break;

      case CryptoType.sha512_224:
        convert = sha512224;
        break;

      case CryptoType.sha512_256:
        convert = sha512256;
        break;

      case CryptoType.md5:
        convert = md5;
        break;

      case CryptoType.hmac224:
        convert = Hmac(sha224, hmacKey);

        break;

      case CryptoType.hmac256:
        convert = Hmac(sha256, hmacKey);

        break;

      case CryptoType.hmac384:
        convert = Hmac(sha384, hmacKey);

        break;

      case CryptoType.hmac512:
        convert = Hmac(sha512, hmacKey);

        break;

      case CryptoType.hmac512_224:
        convert = Hmac(sha512224, hmacKey);

        break;

      case CryptoType.hmac512_256:
        convert = Hmac(sha512256, hmacKey);

        break;

      case CryptoType.hmacmd5:
        convert = Hmac(md5, hmacKey);

        break;

      default:
    }

    var res = convert != null ? convert.convert(bytes).toString() : '';
    debugPrint('_hashString:$res');

    return res;
  }
}
