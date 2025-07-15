class FormValidators {
  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    } else if (value.length < 3) {
      return 'Username must be at least 3 characters';
    } else if (value.length > 50) {
      return 'Username can\'t be more than 50 characters';
    }
    return null;
  }

  static String? validatefirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Firstname is required';
    } else if (value.length < 3) {
      return 'Firstname must be at least 3 characters';
    } else if (value.length > 30) {
      return 'Firstname can\'t be more than 30 characters';
    }
    return null;
  }

  static String? validatelastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Lastname is required';
    } else if (value.length < 3) {
      return 'Lastname must be at least 3 characters';
    } else if (value.length > 30) {
      return 'Lastname can\'t be more than 30 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    } else if (value.length < 10) {
      return 'Email must be at least 10 characters';
    } else if (value.length > 150) {
      return 'Email can\'t be more than 150 characters';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'This is an invalid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 80) {
      return 'Password can\'t be more than 80 characters';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    } else if (value.length < 8) {
      return 'Phone number must be at least 8 digits';
    } else if (value.length > 20) {
      return 'Phone number can\'t be more than 20 digits';
    } else if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
      return 'Phone number is invalid';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Birth date is required';
    }

    try {
      DateTime.parse(value); 
      return null;
    } catch (_) {
      return 'Invalid date format';
    }
  }
}
