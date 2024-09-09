import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as di;
import 'package:image_picker/image_picker.dart';
import 'package:plants/view/loginPage/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final Dio _dio = Dio();

  //Token functions

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  //Refresh Token:

  Future<void> refreshToken() async {
    String? token = await getToken();

    if (token == null) {
      return; // No token available to refresh
    }

    try {
      var response = await _dio.get(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/refresh-token',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['success'] == true) {
          String newToken = jsonData[
              'access_token']; // Adjust based on your response structure
          await saveToken(newToken);
        } else {
          // Handle refresh token failure (e.g., token expired or invalid)
          await deleteToken();
          Get.offAll(() => loginPage()); // Redirect to login page
        }
      } else {
        // Handle non-200 status codes
        await deleteToken();
        Get.offAll(() => loginPage()); // Redirect to login page
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      await deleteToken();
      Get.offAll(() => loginPage()); // Redirect to login page
    } catch (e) {
      // Handle other exceptions
      await deleteToken();
      Get.offAll(() => loginPage()); // Redirect to login page
    }
  }

  //Login function

  Future<String?> login(String identifier, String password) async {
    try {
      var response = await _dio.post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/login',
        data: {
          'identifier': identifier,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['success'] == true) {
          print("hello it's ok");
          return response.statusMessage; // Assuming the token is returned
        } else {
          Get.snackbar("Error", jsonData['message'][0]);
          return null;
        }
      } else {
        // If the server returns a response but with an error status code
        Get.snackbar("Error", "Failed to login: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle errors with a response from the server
        Get.snackbar(
            "Error", e.response?.data['message'][0] ?? "Unknown server error");
      } else {
        // Handle network or unexpected errors
        Get.snackbar(
            "Error", "Network or unexpected error occurred: ${e.message}");
      }
      return null;
    } catch (e) {
      // Catch any other unexpected exceptions
      Get.snackbar("Error", "Unexpected error: ${e.toString()}");
      return null;
    }
  }

  //Logout function:

  Future<void> logout() async {
    try {
      String? token = await getToken();
      if (token == null) return; // No token available to log out

      // Send the logout request to the backend
      var response = await _dio.post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Check response status
      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['success'] == true) {
          // Successfully logged out, clear the token
          await deleteToken();
          Get.offAll(() => loginPage()); // Redirect to login page
        } else {
          // Handle logout failure (e.g., backend error)
          Get.snackbar("Error", jsonData['message'][0]);
        }
      } else {
        // Handle non-200 status codes
        Get.snackbar("Error", "Failed to logout");
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      Get.snackbar("Error",
          e.response?.data['message'][0] ?? "Network or unexpected error");
    } catch (e) {
      // Handle other exceptions
      Get.snackbar("Error", "Unexpected error: ${e.toString()}");
    } finally {
      // Ensure token is deleted even if there's an error
      await deleteToken();
      Get.offAll(() => loginPage()); // Redirect to login page
    }
  }

  // Function to resend 2FA code
  Future<void> resend2FACode(String email) async {
    try {
      var formData = di.FormData.fromMap({
        'email': email,
      });

      var response = await _dio.post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/resend-2fa-code',
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['success'] == true) {
          Get.snackbar("Success",
              "2FA code resent successfully. Please check your email.");
        } else {
          Get.snackbar("Error", jsonData['message']);
        }
      } else {
        Get.snackbar("Error", "Failed to resend 2FA code");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle errors from the server response
        Get.snackbar(
            "Error", e.response?.data['message'] ?? "Unknown server error");
      } else {
        // Handle network or unexpected errors
        Get.snackbar("Error", "Network or unexpected error: ${e.message}");
      }
    } catch (e) {
      // Catch any other unexpected errors
      Get.snackbar("Error", "Unexpected error: ${e.toString()}");
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required File profilePhoto,
    required File certificate,
    required String phoneNumber,
    required String passwordConfirmation,
  }) async {
    try {
      print("in function");
      // Prepare FormData with files and form fields
      di.FormData formData = di.FormData.fromMap({
        'email': email,
        'password': password,
        'user_name': username,
        'phone_number': phoneNumber,
        'password_confirmation': passwordConfirmation,
        'profile_photo': await di.MultipartFile.fromFile(profilePhoto.path,
            filename: profilePhoto.path.split('/').last),
        'certificate': await di.MultipartFile.fromFile(certificate.path,
            filename: certificate.path.split('/').last),
      });
      print("wait for response");
      var response = await _dio.post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/register',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
      print("before if the stutes code is: ${response.statusCode}");
      if (response.statusCode == 200) {
        print("i am in the if 200");
        var jsonData = response.data;
        if (jsonData['success'] == true) {
          Get.snackbar("Success", jsonData['statue message']);
        } else {
          Get.snackbar("Error", jsonData['message'][0]);
        }
      } else {
        Get.snackbar("Error", "Registration failed");
      }
    } on DioException catch (e) {
      Get.snackbar("Error", e.response?.data['message'][0] ?? "Unknown error");
    }
  }

  // Helper to pick image (profile photo)
  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // Helper to pick PDF (certificate)
  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
}
