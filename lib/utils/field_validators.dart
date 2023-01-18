import 'package:my_therapists/utils/regular_expresions.dart';

extension FieldValidator on String {
  ///-------------- Email Validator -------------------
  get validateEmail {
    if (!RegularExpressions.EMAIL_VALID_REGIX.hasMatch(this) && isNotEmpty) {
      return "Invalid Email";
    } else if (isEmpty) {
      return "Field can't be Empty";
    }
    return null;
  }

  ///---------------- Password Validator -----------------
  get validatePassword {
    if (isEmpty) {
      return "Field Can't be empty";
    } else if (length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  ///---------------- Empty Validator -----------------
  get validateEmpty {
    if (isEmpty) {
      return 'Field can\'t be empty';
    } else {
      return null;
    }
  }

  ///---------------- Phone NUmnber Validator ----------
  get validatePhonNumber {
    if (isEmpty) {
      return 'Field can\'t be empty';
    }
    if (length < 11) {
      return 'Invalid length';
    } else {
      return null;
    }
  }

//--------------Confirm Password Validator--------//
  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Confirm Password';
    } else if (!(password == confirmPassword)) {
      return 'Password Not Match';
    } else {
      return null;
    }
  }

//---------------- OTP Validator ---------------

  String? validateOtp(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

//   String? validateEmpty(String value) {
//     if (value == '') {
//       return "Field can't be empty";
//     }
//     return null;
//   }
}
