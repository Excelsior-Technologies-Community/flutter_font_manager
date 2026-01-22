import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  String _fontFamily = 'Roboto';

  String get fontFamily => _fontFamily;

  void switchFont(String font) {
    if (_fontFamily == font) return;
    _fontFamily = font;
    notifyListeners();
  }

  /// SAFE access method
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

/// InheritedNotifier wrapper
class FontProviderWidget extends InheritedNotifier<FontProvider> {
  const FontProviderWidget({
    super.key,
    required FontProvider notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);
}
