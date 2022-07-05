import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Zifu {
  final Locale locale;

  Zifu(this.locale);

  static Map<String, Map<String, String>> _zifu = {
    "en": {
      "a": "en英文a项的值",
      "b": "en英文b项的值",
      "c": "en英文c项的值",
      "d": "en英文d项的值",
      "e": "en英文e项的值",
    },
    "zh": {
      "a": "zh中文a项的值",
      "b": "zh中文b项的值",
      "c": "zh中文c项的值",
      "d": "zh中文d项的值",
      "e": "zh中文e项的值",
    },
  };

  t(String key) {
    //_bendihuaValues["zh"]["a"]
    //_bendihuaValues["en"]["b"]
    return _zifu[locale.languageCode]?[key];
  }

  static ZifuDelegate delegate = new ZifuDelegate();
}

class ZifuDelegate extends LocalizationsDelegate<Zifu> {
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<Zifu> load(Locale locale) {
    // throw UnimplementedError();
    return SynchronousFuture(Zifu(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Zifu> old) {
    // TODO: implement shouldReload
    // throw UnimplementedError();
    return false;
    //不希望频繁的更新，返回false
  }
}
