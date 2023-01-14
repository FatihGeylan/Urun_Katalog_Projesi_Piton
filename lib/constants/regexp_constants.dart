class RegExpConstans {
  static RegExpConstans? _instance;
  static RegExpConstans? get instance {
    _instance ??= RegExpConstans._init();
    return _instance;
  }

  RegExpConstans._init();

  /// Sadece [Alfa Numerik] => Harf yada Rakam içerebilir
  final alphaNumeric = RegExp(r'^[a-zA-Z0-9]+$');

  /// Sadece [Harf ve Boşluk] içerebilir
  final nameExp = RegExp(r'^[A-zöÖçÇğışŞüÜ\s]+$');

  /// E-posta için sadece x@x.x formatını kabul eder.
  final emailExp = RegExp(
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

}
