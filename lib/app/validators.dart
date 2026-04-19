class Validators {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your email";
    }

    if (!value.contains('@')) {
      return "Invalid email";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter password";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  static String? validateNullOrEmpty(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}