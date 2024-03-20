import 'package:flutter/material.dart';

class AnimationsWidget extends StatefulWidget {
  const AnimationsWidget({super.key});

  @override
  AnimationsWidgetState createState() => AnimationsWidgetState();
}

class AnimationsWidgetState extends State<AnimationsWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _customController;
  late Animation<double> _animation;
  late Animation<double> _customAnimation;
  bool _isVisible = false;
  bool _isLarge = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, // 必须传入一个TickerProvider，通常为当前State对象
      duration: const Duration(seconds: 2), // 设置动画持续时间
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // // 添加动画状态监听，可以在动画状态改变时执行自定义逻辑
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // 当动画完成时，反向播放动画
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // 当动画回到初始状态时，正向播放动画
      }
    });

    _customController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _customAnimation =
        Tween<double>(begin: 0, end: 100).animate(_customController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    _customController.dispose(); // 在组件销毁时释放AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              showExplicitAnimations();
            },
            child: const Text('显式动画')),
        const SizedBox(
          height: 20,
        ),

        //  AnimatedOpacity(
        //     opacity: _visible ? 1.0 : 0.0,
        //     duration: const Duration(seconds: 1),
        //     child: Container(
        //       width: 200,
        //       height: _visible? 100 : 0,
        //       color: Colors.blue,
        //     ),
        //   ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _isVisible ? 300.0 : 200.0,
          height: _isVisible ? 50.0 : 200.0,
          color: _isVisible ? Colors.blue : Colors.red,
          child: const Center(
            child: Text(
              '切换颜色和大小',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        ElevatedButton(
            onPressed: () {
              showImplicitAnimations();
            },
            child: const Text('隐式动画')),
        const SizedBox(
          height: 20,
        ),

        AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 500),
          shape: BoxShape.rectangle,
          elevation: _isLarge ? 20 : 0,
          color: _isLarge ? Colors.blue : Colors.purple,
          shadowColor: Colors.black,
          borderRadius:
              _isLarge ? BorderRadius.circular(20) : BorderRadius.circular(0),
          child: const SizedBox(
            width: 200,
            height: 80,
            child: Center(
              child: Text(
                '切换大小',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showPhysicsBasedAnimation();
            },
            child: const Text(' 物理动画')),
        const SizedBox(
          height: 20,
        ),

        CustomPaint(
          painter: MyCustomPainter(_customAnimation.value),
          child: const SizedBox(
            width: 200,
            height: 200,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showCustomAnimations();
            },
            child: const Text('自定义动画')),
      ],
    ));
  }

  void showExplicitAnimations() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: AlertDialog(
                  title: const Text('Animated Dialog'),
                  content: const Text('This is an animated dialog.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    _controller.reset();
    _controller.forward();
  }

  void showImplicitAnimations() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void showPhysicsBasedAnimation() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  void showCustomAnimations() {
    _customController.reset();
    _customController.forward();
  }
}

class MyCustomPainter extends CustomPainter {
  final double radius;

  MyCustomPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('size:$size, radius:$radius');
    final paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
