import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/l10n/l10n.dart';

import 'locale_provider.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    return Builder(
        // Here the magic happens
        // this builder function will generate a new BuilContext for you
        builder: (BuildContext newContext) {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          value: locale,
          icon: Icon(Icons.arrow_drop_down),
          items: L10n.all.map(
            (locale) {
              final flag = L10n.getFlag(locale.languageCode);

              return DropdownMenuItem(
                child: Center(
                  child: Text(
                    flag,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                value: locale,
                onTap: () {
                  final provider = Provider.of<LocaleProvider>(context, listen: false);

                  provider.setLocale(locale);
                },
              );
            },
          ).toList(),
          onChanged: (_) {},
        ),
      );
    });
  }
}
