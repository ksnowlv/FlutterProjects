import 'package:flutter/material.dart';

class CustomRenderObjectWidget extends LeafRenderObjectWidget {
  const CustomRenderObjectWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderObject();
  }

  @override
  void updateRenderObject(BuildContext context, covariant CustomRenderObject renderObject) {
  
    super.updateRenderObject(context, renderObject);

    renderObject.text = 'hello my custom base Widget';
  }

}

class CustomRenderObject extends RenderBox {
  String _text = '';
  Color _backgroundColor = Colors.purple; 

  set text(String txt) {
    _text = txt;
    markNeedsPaint();
  }

    // 设置背景色的方法
  set backgroundColor(Color color) {
    _backgroundColor = color;
    markNeedsPaint();
  }


  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
     context.canvas.drawRect(offset & size, Paint()..color = _backgroundColor);

    final TextSpan textSpan = TextSpan(
      text: _text,
      style: const TextStyle(color: Colors.blue, fontSize: 20.0),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 3, // 设置最大行数，根据需要更改
      textAlign: TextAlign.left, 
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    //文本垂直居中，如果不需要，则纵向yOffset可为0；
    final yOffset = (size.height - textPainter.height) / 2;
    textPainter.paint(context.canvas, offset + Offset(0, yOffset));
  }

  @override 
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    return const Size(200, 100);
  }
}
