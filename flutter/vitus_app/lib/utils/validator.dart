import 'package:easy_localization/easy_localization.dart';

class Validator {

  static String? id(String? value) {
    String pattern = r'^[A-Za-z][A-Za-z0-9]{7,20}$';
    RegExp regex = RegExp(pattern);

    if(value == null || value.isEmpty) {
      return "error_id_is_empty".tr(); //아이디를 입력하여 주세요.
    } else if (value.length < 8) {
      return "error_id_min_length".tr(); //아이디는 8자 이상이여야 합니다.
    } else if ( !regex.hasMatch(value)) {
      return "error_id_regex".tr();  // 올바른 아이디 형식이 아닙니다.
    }
    return null;
  }
  static String? pass(String? value) {
    final String patternNumber = r'[0-9]';
    final String patternChar = r'[A-Za-z]';
    final String patternSpecialChar = r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\]';

    RegExp regexNumber = RegExp(patternNumber);
    RegExp regexChar = RegExp(patternChar);
    RegExp regexSpecialChar = RegExp(patternSpecialChar);

    if(value == null || value.isEmpty) {
      return "error_pass_is_empty".tr();
    } else if(value.length < 8) {
      return "error_pass_min_length".tr();
    } else if( !regexChar.hasMatch(value)) {
      return "error_pass_char".tr();
    } else if(!regexNumber.hasMatch(value)) {
      return "error_pass_number".tr();
    }else if(!regexSpecialChar.hasMatch(value)) {
      return "error_pass_specialchar".tr();
    }

  }
}