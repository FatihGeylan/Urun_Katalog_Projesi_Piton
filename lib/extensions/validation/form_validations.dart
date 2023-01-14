import '../../constants/regexp_constants.dart';

extension StringValidatorExtensions on String {
  bool get isValidAlphaNumeric => RegExpConstans.instance!.alphaNumeric.hasMatch(this);
  bool get isValidName => RegExpConstans.instance!.nameExp.hasMatch(this);
  bool get isValidEmail => RegExpConstans.instance!.emailExp.hasMatch(this);

  ///  Name Validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Name.';
      //
    }
    if (value.length < 2 || value.length > 50 || !value.isValidName) {
      return 'Name can only contain A-z and length between 2-50 .';
    }
    return null;
  }

  ///  E-mail validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your e-mail';
      //
    }
    if (!value.isValidEmail) {
      return 'Please enter a valid e-mail.(x@x.x)';
      //Lütfen e-postanı dikkatlice kontrol et.
      // Lütfen e-posta adresine bir "@" işareti ekleyin. "$_email" adresinde "@" eksik.
    }
    return null;
  }


  /// Password Validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
      //
    }
    if (value.length < 6 || value.length > 20) {
      return 'Passwords must be between 6-20 characters';
    }
    if (!value.isValidAlphaNumeric) {
      return 'Passwords can only contain valid letters and numbers';
    }
    return null;
  }

  ///  Null yada Boş mu?
  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the empty field.';
    } else {
      return null;
    }
  }
}
