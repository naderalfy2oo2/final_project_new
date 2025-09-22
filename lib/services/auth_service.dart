import 'dart:async';

class AuthService {

  static const String _validEmail = "test@example.com";
  static const String _validPassword = "123456";
  static const String _validPhone = "01094323367";
  static const String _validCountry = "Egypt";
  static const String _validBirthDate = "2000-01-01";
  static const String _validGender = "Male";


  static Future<String> registerUser({
    required String email,
    required String phone,
    required String country,
    required String password,
    required String birthDate,
    required String gender,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.trim().toLowerCase() == _validEmail.toLowerCase() &&
        password == _validPassword &&
        phone == _validPhone &&
        country == _validCountry &&
        birthDate == _validBirthDate &&
        gender == _validGender) {
      print("✅ Register Success: البيانات صحيحة");
      return "success";
    } else {
      print("❌ Register Failed: البيانات غلط");
      print(
          "👉 Entered: email=$email, phone=$phone, country=$country, birthDate=$birthDate, gender=$gender, password=$password");
      print(
          "👉 Expected: email=$_validEmail, phone=$_validPhone, country=$_validCountry, birthDate=$_validBirthDate, gender=$_validGender, password=$_validPassword");
      return "Invalid registration data!";
    }
  }


  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.trim().toLowerCase() == _validEmail.toLowerCase() &&
        password == _validPassword) {
      print("✅ Login Success: البيانات صحيحة");
      return "success";
    } else {
      print("❌ Login Failed: البيانات غلط");
      print("👉 Entered: email=$email, password=$password");
      print("👉 Expected: email=$_validEmail, password=$_validPassword");
      return "Invalid email or password";
    }
  }
}
