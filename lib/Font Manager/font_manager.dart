import 'package:flutter/material.dart';

class FontManager extends ChangeNotifier {
  static final FontManager instance = FontManager._internal();
  FontManager._internal();

  String _fontFamily = 'Roboto';

  String get fontFamily => _fontFamily;

  void switchFont(String font) {
    _fontFamily = font;
    notifyListeners();
  }
}
