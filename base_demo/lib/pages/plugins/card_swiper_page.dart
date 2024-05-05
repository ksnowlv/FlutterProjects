import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';


/*
 * CardView类定义了一个 StatelessWidget，用于构建一个带有卡片名称和图片的卡片视图。
 *
 * 参数:
 * - cardName: 卡片的名称，类型为 String，必需。
 * - imageUrl: 卡片图片的URL，类型为 String，必需。
 */
class CardView extends StatelessWidget {
  final String cardName;
  final String imageUrl;

  const CardView({super.key, required this.cardName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
      //构建函数返回一个SingleChildScrollView，其中包含卡片的名称和图片。
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            cardName,
            style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.normal, 
                color: Colors.purpleAccent
                ),
          ),
          const SizedBox(height: 20),
          // 使用CachedNetworkImage展示网络图片，提供占位符和错误图标。
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

class CardSwiperPage extends StatefulWidget {
  final String title;

  const CardSwiperPage({super.key, required this.title});

  @override
  State<CardSwiperPage> createState() => _CardSwiperPageState();
}

class _CardSwiperPageState extends State<CardSwiperPage> {
  static const List<List<String>> cardList = [
    ['卡片 1', 'https://t7.baidu.com/it/u=2581522032,2615939966&fm=193&f=GIF'],
    ['卡片 2', 'https://t7.baidu.com/it/u=245883932,1750720125&fm=193&f=GIF'],
    ['卡片 3', 'https://t7.baidu.com/it/u=3241434606,2550606435&fm=193&f=GIF'],
    ['卡片 4', 'https://t7.baidu.com/it/u=826329656,2212580321&fm=193&f=GIF'],
    ['卡片 5', 'https://t7.baidu.com/it/u=1416385889,2308474651&fm=193&f=GIF']
  ];

  final CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CardSwiper(
                controller: controller,
                cardsCount: cardList.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(20, 20),
                padding: const EdgeInsets.all(20.0),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) =>
                    CardView(
                        cardName: cardList[index][0],
                        imageUrl: cardList[index][1]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.undo,
                    child: const Icon(Icons.rotate_left),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.top),
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.bottom),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      '_onSwipe The card: previousIndex:$previousIndex, currentIndex: $currentIndex, direction${direction.name}',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      '_onUndo The card: previousIndex:$previousIndex, currentIndex: $currentIndex, direction${direction.name}',
    );
    return true;
  }
}
