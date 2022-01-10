import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('de'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'AR';
      case 'de':
        return 'DE';

      default:
        return 'EN';
    }
  }
}
