import 'package:flutter/material.dart';
import 'font_provider.dart';

class FontButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FontButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final font = FontProvider.of(context).fontFamily;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontFamily: font),
        ),
      ),
    );
  }
}
