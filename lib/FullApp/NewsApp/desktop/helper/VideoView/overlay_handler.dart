import 'package:flutter/material.dart';

class OverlayHandlerProviderDesktop with ChangeNotifier {
  OverlayEntry overlayEntry;
  double _aspectRatio = 1.77;
  bool inPipMode = false;
  bool isfullscreen = false;
  ThemeData _themeData;
  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  enablePip(double aspect) {
    inPipMode = true;
    _aspectRatio = aspect;
    print("$inPipMode enablePip");
    notifyListeners();
  }

  disablePip() {
    inPipMode = false;
    print("$inPipMode disablePip");
    notifyListeners();
  }

  get overlayActive => overlayEntry != null;
  get aspectRatio => _aspectRatio;

  insertOverlay(BuildContext context, OverlayEntry overlay) {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = null;
    inPipMode = false;
    Overlay.of(context).insert(overlay);
    overlayEntry = overlay;
  }

  setFullScreenValue(bool val) {
    isfullscreen = val;
    inPipMode = false;

    notifyListeners();
  }

  removeOverlay(BuildContext context) {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = null;
  }
}
