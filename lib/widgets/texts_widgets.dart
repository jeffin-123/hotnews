import 'package:flutter/material.dart';

class TextsWidgets extends StatelessWidget {
  final String? texts;
  final TextStyle? style;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextsWidgets({
    super.key,
    this.texts,
    this.style,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texts ?? "",
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}
