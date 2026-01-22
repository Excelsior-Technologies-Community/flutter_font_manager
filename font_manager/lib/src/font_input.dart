import 'package:flutter/material.dart';
import 'font_provider.dart';

class FontInput extends StatefulWidget {
  final String hint;

  const FontInput({super.key, required this.hint});

  @override
  State<FontInput> createState() => _FontInputState();
}

class _FontInputState extends State<FontInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = FontProvider.of(context);

    return AnimatedBuilder(
      animation: provider,
      builder: (context, _) {
        return TextField(
          controller: _controller, // 🔥 keeps text
          style: TextStyle(fontFamily: provider.fontFamily),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(fontFamily: provider.fontFamily),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
