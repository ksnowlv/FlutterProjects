import 'package:flutter/material.dart';
import 'package:base_demo/pages/customwidget/gradient_circular_progress_indicator.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  const GradientCircularProgressRoute({super.key});

  @override
  State<GradientCircularProgressRoute> createState() =>
      _GradientCircularProgressRouteState();
}

class _GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    debugPrint('_GradientCircularProgressRouteState dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GradientCircularProgressIndicator(
                    radius: 20.0,
                    colors: const [Colors.blue, Colors.blue],
                    value: _animationController.value),
                const SizedBox(
                  height: 10,
                ),
                GradientCircularProgressIndicator(
                  colors: const [Colors.red, Colors.orange],
                  radius: 30.0,
                  strokeWidth: 3.0,
                  value: _animationController.value,
                ),
                const SizedBox(
                  height: 10,
                ),
                GradientCircularProgressIndicator(
                  colors: const [Colors.red, Colors.orange, Colors.red],
                  radius: 40.0,
                  strokeWidth: 5.0,
                  value: _animationController.value,
                ),
                const SizedBox(
                  height: 10,
                ),
                GradientCircularProgressIndicator(
                  colors: const [Colors.teal, Colors.cyan],
                  radius: 50.0,
                  strokeWidth: 5.0,
                  strokeCapRound: true,
                  value: CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.decelerate,
                  ).value,
                ),
                const SizedBox(
                  height: 10,
                ),
                GradientCircularProgressIndicator(
                  colors: [Colors.blue.shade700, Colors.blue.shade200],
                  radius: 60.0,
                  strokeWidth: 20.0,
                  value: _animationController.value,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
