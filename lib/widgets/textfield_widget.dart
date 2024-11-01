import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final double? size;
  final Color? color;
  final TextInputType? textInputType;
  final int? maxLines;
  final Icon? icon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Color? borderColor;


  const TextFieldWidget(
      {super.key,
      this.hintText,
      this.labelText,
      this.size,
      this.color,
      this.textInputType,
      this.maxLines,
      this.icon,
      this.onTap,
       this.controller,
      this.borderColor, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: size, color: color ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.yellow),
        ),
      ),
      keyboardType: textInputType,
      style: TextStyle(color: color ?? Colors.white),
    );
  }
}
