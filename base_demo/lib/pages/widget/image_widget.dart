import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('ImageWidget build');
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/images/bk.png")),
          Image.asset(
            'assets/images/home.png',
            width: 100,
          ),
          const Image(
            image: NetworkImage(
                "https://img.zcool.cn/community/0170645bbdc6f0a801213deabfc0a7.jpg@2o.jpg"),
            width: 100.0,
          ),
          const SizedBox(height: 20,),
          Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg",
            width: 100.0,
          ),
          const SizedBox(height: 20,), 
          Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg",
            width: 100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
          ),
          const SizedBox(height: 20,), 
          const Text('Image repeatY'),
          Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 100, 
            height: 100, 
            repeat: ImageRepeat.repeatY,
          ),

           const Text('Image BoxFit.fill'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit: BoxFit.fill,
          ), 

              const Text('Image BoxFit.contain'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 100, 
            height: 100, 
            fit: BoxFit.contain,
          ), 

                const Text('Image  BoxFit.cover'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit:  BoxFit.cover,
          ),

                const Text('Image BoxFit.fitWidth'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit: BoxFit.fitWidth,
          ),

                const Text('Image  BoxFit.fitHeight'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit:  BoxFit.fitHeight,
          ),

                const Text('Image BoxFit.contain'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit: BoxFit.contain,
          ),

                const Text('Image  BoxFit.scaleDown'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200, 
            height: 100, 
            fit:  BoxFit.scaleDown,
          ),

                const Text('Image BoxFit.none'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 100, 
            height: 200, 
            fit: BoxFit.none,
          ),

            const Text('Image colorBlendMode: BlendMode.difference'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 200,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            fit: BoxFit.fill,
          ), 
        const Text('Image ImageRepeat.repeatY'),
            Image.network(
            "https://img-baofun.zhhainiao.com/fs/f63296f48d6e66f917fd27e2538ace0c.jpg", 
            width: 100,
            height: 200,
            repeat: ImageRepeat.repeatY,
          ), 

        ],
      ),
    );
  }
}
