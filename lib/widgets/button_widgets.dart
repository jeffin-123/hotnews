import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final Icon? icon;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  const ButtonWidgets(
      {super.key, this.icon, this.size, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: icon ?? const Icon(Icons.arrow_back,),
      color: color,
      iconSize: size,
    );
  }
}
