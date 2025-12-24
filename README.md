#  Flutter Font Manager

A lightweight, dependency-free Flutter font management system
that enables runtime font switching across your entire app using
ChangeNotifier + InheritedNotifier.

Perfect for text editors, accessibility controls, theme customization,
and CMS-style apps.



---

## ✨ Features

🔁 Switch fonts at runtime without restarting the app
🧠 Centralized global font state
✍️ TextField preserves typed text while font changes
🧩 Reusable widgets (FontText, FontInput, FontButton)
⚡ Clean architecture using InheritedNotifier
🚫 No Provider / Riverpod / Bloc dependencies
📦 Easy to convert into a reusable package

---

## ✨ Preview






https://github.com/user-attachments/assets/f342087f-222d-47a5-815c-37993f2044ac




---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
flutter:
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf

    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf

    - family: Montserrat
      fonts:
        - asset: assets/fonts/Montserrat-Regular.ttf
```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
lib/
│
├── font_provider.dart
├── font_input.dart
├── font_button.dart
├── font_text.dart
├── font_demo_screen.dart
└── main.dart

  ```

## 🧠 Core: Font Provider

```
import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  String _fontFamily = 'Roboto';

  String get fontFamily => _fontFamily;

  void switchFont(String font) {
    if (_fontFamily == font) return;
    _fontFamily = font;
    notifyListeners();
  }

  static FontProvider of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<FontProviderWidget>();

    if (widget == null || widget.notifier == null) {
      throw FlutterError(
        'FontProvider not found.\n'
        'Wrap your app with FontProviderWidget.',
      );
    }

    return widget.notifier!;
  }
}

class FontProviderWidget extends InheritedNotifier<FontProvider> {
  const FontProviderWidget({
    super.key,
    required FontProvider notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);
}

```

## ⌨️ FontInput (TextField with Live Font)
```
class FontInput extends StatefulWidget {
  final String hint;
  const FontInput({super.key, required this.hint});

  @override
  State<FontInput> createState() => _FontInputState();
}

class _FontInputState extends State<FontInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = FontProvider.of(context);

    return AnimatedBuilder(
      animation: provider,
      builder: (_, __) => TextField(
        controller: _controller,
        style: TextStyle(fontFamily: provider.fontFamily),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(fontFamily: provider.fontFamily),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}


```
## 🔘 FontButton
```
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

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontFamily: font),
      ),
    );
  }
}


```
## 🚀 Usage (Demo App)

Below is a complete demo screen showcasing all buttons included in
**Advanced Button Pack**.

```
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
            const FontInput(hint: "Type something here..."),

            const SizedBox(height: 20),

            FontButton(
              text: "Switch to Poppins",
              onPressed: () => manager.switchFont("Poppins"),
            ),
            FontButton(
              text: "Switch to Montserrat",
              onPressed: () => manager.switchFont("Montserrat"),
            ),
            FontButton(
              text: "Switch to Roboto",
              onPressed: () => manager.switchFont("Roboto"),
            ),
          ],
        ),
      ),
    );
  }
}
```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
