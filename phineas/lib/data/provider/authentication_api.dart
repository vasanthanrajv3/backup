import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/constant.dart';
import '../../widgets/reuse.dart';

class AuthenticationAPI {

  Future<dynamic> loginAPI(
      {required String email, required String password}) async {
    var body = jsonEncode({"email": email, "password": password});
    print(baseUrl());

    try {
      final http.Response response = await http.post(
        Uri.parse('${baseUrl()}$login'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Login failed: ${response.body}');
        toastMessage(message: "Error: ${jsonDecode(response.body)['detail']}");
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      toastMessage(message: "Error: $e");
      return null;
    }
  }

  Future<dynamic> registerAPI({required String email,
    required String password,
    required String firstName,
    required String lastName}) async {
    var body = jsonEncode({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password
    });

    print('${baseUrl()}$register');

    try {
      final http.Response response = await http.post(
        Uri.parse('$baseUrl$register'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('SignUp failed: ${response.body}');
        toastMessage(message: "Error: ${jsonDecode(response.body)['detail']}");
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      toastMessage(message: "Error: $e");
      return null;
    }
  }

  Future<dynamic> otpVerificationAPI({
    required String email,
    required String otp,
  }) async {
    print('$baseUrl$register');

    try {
      final http.Response response = await http.post(
        Uri.parse('${baseUrl()}$otpVerify?email=$email&otp=$otp'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('SignUp failed: ${response.body}');
        toastMessage(message: "Error: ${jsonDecode(response.body)['detail']}");
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      toastMessage(message: "Error: $e");
      return null;
    }
  }
}
