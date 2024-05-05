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
  hmac256, 
  hmac512, 
  hmacmd5, // (i.e. HMAC-MD5, HMAC-SHA1, HMAC-SHA256)
}

class CryptoPage extends StatefulWidget {
  final String title;

  const CryptoPage({super.key, required this.title});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.sha1),
                child: const Text('sha1')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.sha224),
                child: const Text('sha224')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.sha256),
                child: const Text('sha256')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.sha384),
                child: const Text('sha384')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.sha512),
                child: const Text('sha512')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    _hashString('hello world', CryptoType.sha512_224),
                child: const Text('sha512_224')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    _hashString('hello world', CryptoType.sha512_256),
                child: const Text('sha512_256')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.md5),
                child: const Text('md5')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.hmac256),
                child: const Text('hmac256')),
            const SizedBox(
              height: 20,
            ),
                  ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.hmac512),
                child: const Text('hmac512')),
            const SizedBox(
              height: 20,
            ),
                    ElevatedButton(
                onPressed: () => _hashString('hello world', CryptoType.hmacmd5),
                child: const Text('hmacmd5')),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _hashString(String text, CryptoType type) {
    if (text.isEmpty) {
      return '';
    }
    var bytes = utf8.encode(text); // data being hashed
    var res = '';

    switch (type) {
      case CryptoType.sha1:
        res = sha1.convert(bytes).toString();
        break;
      case CryptoType.sha224:
        res = sha224.convert(bytes).toString();
        break;
      case CryptoType.sha256:
        res = sha256.convert(bytes).toString();
        break;

      case CryptoType.sha384:
        res = sha384.convert(bytes).toString();
        break;

      case CryptoType.sha512:
        res = sha512.convert(bytes).toString();
        break;

      case CryptoType.sha512_224:
        res = sha512224.convert(bytes).toString();
        break;

      case CryptoType.sha512_256:
        res = sha512256.convert(bytes).toString();
        break;

      case CryptoType.md5:
        res = md5.convert(bytes).toString();
        break;

      case CryptoType.hmac256:
        var key = utf8.encode('p@ssw0rd');

        var hmacSha256 = Hmac(sha256, key);
        res = hmacSha256.convert(bytes).toString();

        break;

      case CryptoType.hmac512:
        var key = utf8.encode('p@ssw0rd');

        var hmacSha512 = Hmac(sha512, key);
        res = hmacSha512.convert(bytes).toString();

        break;  

      case CryptoType.hmacmd5:
        var key = utf8.encode('p@ssw0rd');

        var hmacMD5 = Hmac(md5, key);
        res = hmacMD5.convert(bytes).toString();

        break; 

      default:
    }

    debugPrint('_hashString:$res');

    return res;
  }
}
