import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final double? size;
  final ButtonStyle? buttonStyle;
  final bool isLoading;

  const TextbuttonWidget(
      {super.key,
      this.onPressed,
      required this.text,
      this.color,
      this.size,
      this.buttonStyle,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: size,
              ),
            ),
    );
  }
}
