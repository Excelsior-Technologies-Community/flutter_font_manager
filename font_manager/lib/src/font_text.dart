import 'package:flutter/material.dart';
import 'font_provider.dart';

class FontText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;

  const FontText(
      this.text, {
        super.key,
        this.size = 16,
        this.weight = FontWeight.normal,
        this.color,
      });

  @override
  Widget build(BuildContext context) {
    final font = FontProvider.of(context).fontFamily;

    return Text(
      text,
      style: TextStyle(
        fontFamily: font,
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
