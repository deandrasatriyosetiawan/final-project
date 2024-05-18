import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void resetPassword({required String email}) async {
    if (email.isNotEmpty && email.isEmail) {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      customSnackBar(
        "Berhasil",
        "Link pengaturan ulang kata sandi dikirim ke email Anda.",
      );
      Get.offNamed(Routes.LOGIN);
      emailController.clear();
    } else {
      customSnackBar(
        "Gagal",
        "Harap masukkan email yang valid.",
      );
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
