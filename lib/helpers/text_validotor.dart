class TextValidatioinController {
  static isPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Please enter atleast 6 characters as password";
    } else {
      return null;
    }
  }

  static isTextValid(String? value) {
    if (value == null || value.isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }

  // static isnumber(PhoneNumber? value) {
  //   if (value!.isValidNumber()) {
  //     return null;
  //   } else {
  //     return 'Please Enter a valid phone number';
  //   }

  //   // if (value == null || value.number.isEmpty) {
  //   //   return "Please enter your number";
  //   // } else if (value.number.length < 10) {
  //   //   return "Please enter atleast 10 characters as N umber";
  //   // } else {
  //   //   return null;
  //   // }
  // }

  static nameenter(String? name) {
    if (name == null || name.isEmpty) {
      return 'this field is required';
    }
    return null;
  }

  static isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter your email address";
    } else if (!email.contains("@") &&
        (!email.contains(".com") ||
            !email.contains(".co") ||
            !email.contains(".co.in"))) {
      return "please enter a valid email address";
    } else {
      return null;
    }
  }
}
