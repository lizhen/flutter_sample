import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get action_cancel => "Cancel";

  String get action_font_size => "Font Size";

  String get action_load_error => "Load Error";

  String get action_loading => "Loading";

  String get action_not_starred => "Not Starred";

  String get action_ok => "OK";

  String get action_starred => "Starred";

  String get action_starred_list => "Starred List";

  String get action_theme => "Theme";

  String get author => "author";

  String get content_load_error => "Load error, click to reload.";

  String get content_not_starred => "No articles have been starred yet.";

  String get day_after => "Day After";

  String get day_before => "Day Before";

  String get random => "Random";

  String get title_clear_starred =>
      "Are you sure to clear all starred articles?";

  String get today => "Today";

  String get word_count => "word count";

  String get yesterday => "Yesterday";
}

class $en extends S {
  const $en();
}

class $zh extends S {
  const $zh();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get author => "作者";

  @override
  String get action_not_starred => "未收藏";

  @override
  String get title_clear_starred => "确定要清空所有收藏吗？";

  @override
  String get action_starred => "已收藏";

  @override
  String get action_load_error => "加载失败";

  @override
  String get yesterday => "昨天";

  @override
  String get content_not_starred => "还没有收藏任何文章";

  @override
  String get random => "随机";

  @override
  String get word_count => "字数";

  @override
  String get action_loading => "加载中";

  @override
  String get action_cancel => "取消";

  @override
  String get action_ok => "确定";

  @override
  String get day_before => "前一天";

  @override
  String get content_load_error => "加载失败，点击重试。";

  @override
  String get today => "今天";

  @override
  String get action_font_size => "字号";

  @override
  String get action_theme => "主题";

  @override
  String get action_starred_list => "收藏列表";

  @override
  String get day_after => "后一天";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("zh", ""),
    ];
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          return SynchronousFuture<S>(const $en());
        case "zh":
          return SynchronousFuture<S>(const $zh());
        default:
        // NO-OP.
      }
    }
    return SynchronousFuture<S>(const S());
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();
