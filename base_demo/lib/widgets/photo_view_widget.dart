import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewWidget extends StatefulWidget {
  const PhotoViewWidget({super.key});

  @override
  PhotoViewWidgetState createState() => PhotoViewWidgetState();
}

class PhotoViewWidgetState extends State<PhotoViewWidget> {
  var imageUrls = [
    'https://img1.baidu.com/it/u=2205810988,4283060315&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
    'https://p4.itc.cn/q_70/images03/20230512/32c7ad09b5904bea8506d74f96483000.png',
    'http://pic1.win4000.com/wallpaper/2/5859e7ee330bb.jpg',
    'http://pic1.win4000.com/wallpaper/9/594cc06f555e8.jpg',
    'http://pic1.win4000.com/wallpaper/3/59292bb874fde.jpg', 
    'https://img-baofun.zhhainiao.com/fs/dea71801d2aef7bc36690c5ae4f0e454.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PhotoView(
            imageProvider: const AssetImage("images/photo_view_test.png"),
          ),
        ),
        Expanded(
          child: PhotoViewGallery.builder(
            itemCount: imageUrls.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrls[index]),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                heroAttributes: PhotoViewHeroAttributes(tag: 'tag$index'),
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(), // 可以传递自定义的PageController
          ),
        ),
      ],
    );
  }
}
