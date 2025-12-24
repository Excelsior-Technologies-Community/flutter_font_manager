import 'package:flutter/material.dart';
import 'font_button.dart';
import 'font_input.dart';
import 'font_provider.dart';
import 'font_text.dart';

class FontDemoScreen extends StatelessWidget {
  const FontDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = FontProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Font Manager Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FontText(
              "Font Manager Demo",
              size: 24,
              weight: FontWeight.bold,
            ),

            const SizedBox(height: 10),

            const FontText(
              "This demonstrates runtime font switching in Flutter.",
              size: 14,
              color: Colors.grey,
            ),

            const SizedBox(height: 15),

            const FontInput(hint: "Type something here..."),

            const SizedBox(height: 15),

            FontButton(
              text: "PRIMARY BUTTON",
              onPressed: () {},
            ),

            const SizedBox(height: 20),

            const FontText(
              "Switch Fonts At Runtime:",
              weight: FontWeight.bold,
            ),

            const SizedBox(height: 10),

            FontButton(
              text: "SWITCH TO POPPINS",
              onPressed: () => manager.switchFont("Poppins"),
            ),

            FontButton(
              text: "SWITCH TO MONTSERRAT",
              onPressed: () => manager.switchFont("Montserrat"),
            ),

            FontButton(
              text: "SWITCH TO ROBOTO",
              onPressed: () => manager.switchFont("Roboto"),
            ),
          ],
        ),
      ),
    );
  }
}
