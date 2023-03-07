enum Languages {
  persian,
  english,
  myanmar,
  arabic,
  chinese,
  japanese,
  korean,
  other
}

class JackLanguageDetect {
  static final _persian = RegExp(r'[\u0600-\u06FF]');
  static final _english = RegExp(r'[a-zA-Z]');
  static final _myanmar = RegExp(r'[\u1000-\u1021]');
  static final _arabic = RegExp(r'[\u0750-\u077F]');
  static final _chinese = RegExp(r'[\u4E00-\u9FFF]');
  static final _japanese = RegExp(r'[\u3040-\u309F]');
  static final _korean = RegExp(r'[\uAC00-\uD7AF]');

  static List<Languages> detect({required String str}) {
    List<Languages> languages = [];

    if (_persian.hasMatch(str)) {
      languages.add(Languages.persian);
    }
    if (_english.hasMatch(str)) {
      languages.add(Languages.english);
    }
    if (_arabic.hasMatch(str)) {
      languages.add(Languages.arabic);
    }
    if (_chinese.hasMatch(str)) {
      languages.add(Languages.chinese);
    }
    if (_japanese.hasMatch(str)) {
      languages.add(Languages.japanese);
    }
    if (_korean.hasMatch(str)) {
      languages.add(Languages.korean);
    }
    if (_myanmar.hasMatch(str)) {
      languages.add(Languages.myanmar);
    }
    if (languages.isEmpty) {
      languages.add(Languages.other);
    }
    return languages;
  }

  static bool detectMyanmar({required String str}) {
    return detect(str: str).contains(Languages.myanmar);
    // if (_myanmar.hasMatch(str)) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
