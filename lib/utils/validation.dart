String? validateEmail(value) {
  Pattern patten = r'^[\w.-]+@[\w.-]+\.(?:com)$';
  RegExp regex = RegExp(patten.toString());
  if (value.length == 0) {
    return "Enter Email";
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid email ';
  } else if (value.length == 1) {
    return null;
  }
  return null;
}

String? nameValidation(value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "Please enter name.";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String normalizeExpiryDate(expiryDate) {
  if (expiryDate.length == 4 && expiryDate.indexOf('/') == 1) {
    return "0$expiryDate";
  }
  return expiryDate;
}

String? validateDate(value) {
  if (value == null || value.isEmpty) {
    return "This field is required";
  }
  int year;
  int month;
  if (value.contains(RegExp(r'(/)'))) {
    var split = value.split(RegExp(r'(/)'));

    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }
  if ((month < 1) || (month > 12)) {
// A valid month is between 1 (January) and 12 (December)
    return 'Expiry month is invalid';
  }
  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
// We are assuming a valid should be between 1 and 2099.
// Note that, it's valid doesn't mean that it has not expired.
    return 'Expiry year is invalid';
  }
  // if (!hasDateExpired(month, year)) {
  //   return "Card has expired";
  // }
  return null;
}

int convertYearTo4Digits(int year) {
  if (year < 100 && year >= 0) {
    var now = DateTime.now();
    String currentYear = now.year.toString();
    String prefix = currentYear.substring(0, currentYear.length - 2);
    year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
  }
  return year;
}

bool hasDateExpired(int month, int year) {
  return isNotExpired(year, month);
}

bool isNotExpired(int year, int month) {
// It has not expired if both the year and date has not passed
  return !hasYearPassed(year) && !hasMonthPassed(year, month);
}

bool hasMonthPassed(int year, int month) {
  var now = DateTime.now();
// The month has passed if:
// 1. The year is in the past. In that case, we just assume that the month
// has passed
// 2. Card's month (plus another month) is more than current month.
  return hasYearPassed(year) ||
      convertYearTo4Digits(year) == now.year && (month < now.month + 1);
}

bool hasYearPassed(int year) {
  int fourDigitsYear = convertYearTo4Digits(year);
  var now = DateTime.now();
  return fourDigitsYear < now.year;
}

String? validateAddress(value) {
  String pattern = r"(^[a-zA-Z0-9. ,/-/\s+|[^'-\w]+|[0-9]+/]*$)";
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "Please enter a address";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter valid address ";
  }
  return null;
}

String? validateZipCode(value) {
  String pattern = r"^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$";
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "Please enter a Zip code";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter valid Zip code";
  }
  return null;
}

String? validateFloorCode(value) {
  String pattern = r"^[a-z0-9][a-z0-9\- ,]{0,10}[a-z0-9]$";
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "Please enter a floor/apartment";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter valid floor/apartment";
  }
  return null;
}

String? validateAccountNumber(value) {
  String pattern = '[0-9]{9,18}';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter Account Number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid Account Number';
  }
  return null;
}

String? validateAmountNumber(value) {
  String pattern = '[0-9]';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter own amount';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter valid own amount';
  }
  return null;
}

String? validateCardNumber(value) {
  String pattern = '[0-9 ]{9,18}';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter Card Number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Card Number';
  }
  return null;
}

String? validateIBANNumber(value) {
  String pattern = '[0-9]{9,18}';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter IBAN Number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter IBAN Number';
  }
  return null;
}

String? validateCVV(value) {
  if (value.isEmpty) {
    return 'fill this field';
  }
  if (value.length < 3 || value.length > 4) {
    return "CVV is invalid";
  }
  return null;
}

String? lastNameValidation(value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "fill required field";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validatePassword(value) {
  bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
  bool hasDigits = value.contains(RegExp(r'[0-9]'));
  bool hasLowercase = value.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  //bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  var minLength = 8;
  bool hasMinLength = value.length >= minLength;
  //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  if (value.isEmpty) {
    return 'Enter new password';
  }
  if (!hasDigits) {
    return 'Use minimum 8 characters, and at least one letter and one number with special character';
  }
  if ((!hasUppercase) && (!hasLowercase)) {
    return 'Use minimum 8 characters, and at least one letter and one number with special character';
  }
  if (!hasMinLength) {
    return 'Use minimum 8 characters, and at least one letter and one number with special character';
  }
  if (!hasSpecialCharacters) {
    return 'Use minimum 8 characters, and at least one letter and one number with special character';
  }
  return null;
}

String? password(value) {
  if (value.isEmpty) {
    return 'Enter password';
  }
  if (value.length < 8) {
    return 'Enter At Least 8 Character';
  }
  return null;
}

String? confirmPasswordValidation(value, compareValue) {
  if (value.isEmpty) {
    return "password and confirm password compulsory matched";
  } else if (value != compareValue) {
    return "required field is not matched";
  } else {
    return null;
  }
}

String? validateMobile(value) {
  String patttern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regExp = RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validateAccessCode(value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return "AccessCode is Required";
  } else if (value.length != 6) {
    return "AccessCode must 6 digits";
  } else if (!regExp.hasMatch(value)) {
    return "AccessCode must be digits";
  }
  return null;
}
