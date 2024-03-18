import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCacheWidget extends StatelessWidget {
  const ImageCacheWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: "http://via.placeholder.com/350x150",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 200,
        ),
        _sizedContainer(
          const Image(
            image: CachedNetworkImageProvider(
              'https://via.placeholder.com/350x150',
            ),
            width: 200,
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            imageUrl:
                'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: 'https://via.placeholder.com/200x150',
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            imageUrl: 'https://via.placeholder.com/300x150',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.colorBurn,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        CachedNetworkImage(
          imageUrl: 'https://via.placeholder.com/300x300',
          placeholder: (context, url) => const CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 150,
          ),
          imageBuilder: (context, image) => CircleAvatar(
            backgroundImage: image,
            radius: 150,
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            imageUrl: 'https://notAvalid.uri',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            maxHeightDiskCache: 10,
            imageUrl: 'https://via.placeholder.com/350x200',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeInDuration: const Duration(seconds: 3),
          ),
        ),
      ],
    ));
  }

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Center(child: child),
    );
  }
}
