import 'package:final_project/app/modules/register/controllers/register_controller.dart';
import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clearInputText() {
    emailController.clear();
    passwordController.clear();
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      customSnackBar(
        "Berhasil",
        "Anda berhasil masuk.",
      );
      Get.offAllNamed(Routes.HOME);
      clearInputText();
      _registerController.clearInputText();
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        customSnackBar(
          "Gagal",
          "Tidak ditemukan pengguna untuk email tersebut.",
        );
      } else if (error.code == "invalid-email") {
        customSnackBar(
          "Gagal",
          "Alamat email diformat dengan buruk.",
        );
      } else if (error.code == "wrong-password") {
        customSnackBar(
          "Gagal",
          "Kata sandi yang diberikan salah.",
        );
      } else if (error.code == "invalid-credential") {
        customSnackBar(
          "Gagal",
          "Kredensial autentikasi yang diberikan salah atau telah kedaluwarsa.",
        );
      } else if (error.code == "too-many-requests") {
        customSnackBar(
          "Gagal",
          "Terlalu banyak permintaan. Coba lagi nanti.",
        );
      } else {
        customSnackBar(
          "Gagal",
          "Penyebab kesalahan tidak diketahui.",
        );
      }
    }
  }

  void customSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      colorText: Colors.white,
      backgroundColor: title == "Gagal"
          ? Colors.red
          : title == "Berhasil"
              ? Colors.green
              : Colors.grey,
    );
  }
}
