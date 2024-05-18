import 'package:final_project/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 160),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                bottom: 5,
              ),
              child: Text(
                "Daftar",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF3887BE),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                bottom: 30,
              ),
              child: Text(
                "Daftar dengan isi data berikut",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF424242),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  customTextFormField(
                    textEditingController: controller.nameController,
                    hintText: "Nama",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  customTextFormField(
                    textEditingController: controller.phoneNumberController,
                    hintText: "Nomor Telepon",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 30),
                  customTextFormField(
                    textEditingController: controller.emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  customTextFormField(
                    textEditingController: controller.passwordController,
                    hintText: "Kata Sandi",
                    isTextObscured: true,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.register(
                            name: controller.nameController.text,
                            phoneNumber: controller.phoneNumberController.text,
                            email: controller.emailController.text,
                            password: controller.passwordController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3887BE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF3887BE),
                            width: 2,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                      ),
                      child: Text(
                        "Daftar",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun? ",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF424242),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Masuk",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3887BE),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFF3887BE),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customTextFormField({
    required TextEditingController textEditingController,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isTextObscured = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isTextObscured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hintText tidak boleh kosong";
          }
          return null;
        },
        style: GoogleFonts.poppins(
          color: const Color(0xFF5FBDFF),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xFF5FBDFF),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xFF5FBDFF),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xFF5FBDFF),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xFF5FBDFF),
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
      ),
    );
  }
}
