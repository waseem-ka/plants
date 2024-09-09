import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plants/service/serviceApi.dart';
import 'package:plants/view/base_bar.dart';
import 'package:plants/view/loginPage/verification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as di;

class AuthController extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  final Dio _dio = Dio();

  Future<void> login(String email, String password) async {
    isLoading(true); // Set loading state to true while making the request

    try {
      // Call the authService to perform the login
      String? loginSuccess = await authService.login(email, password);

      if (loginSuccess != null) {
        // If login was successful, show a success message
        Get.snackbar("Success",
            "User logged in successfully , We send 2FA code to your email please check it");

        // Navigate to the Verification Page to enter the 2FA code and pass the email
        Get.to(() => Verification(), arguments: email);
      } else {
        // If the login failed, show an error message
        Get.snackbar("Error", "Login failed");
      }
    } finally {
      // Reset loading state to false when the request is finished
      isLoading(false);
    }
  }

  // Function to confirm 2FA code and save token
  Future<void> confirm2FACode(String email, String code) async {
    isLoading(true);
    try {
      // Use Dio's FormData without conflict
      var formData = di.FormData.fromMap({
        'email': email,
        'TwoFactorAuth': code,
      });

      var response = await _dio.post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/confirm-2fa-code', // Replace with your actual backend URL
        data: formData,
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        // Save the access token using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await authService.saveToken(response.data['access_token']);
        await prefs.setString('access_token', response.data['access_token']);

        Get.snackbar("Success", response.data['message']);
        // Navigate to the HomePage after saving the token
        Get.offAll(() => BaseScreen());
      } else {
        Get.snackbar("Error", response.data['message']);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
