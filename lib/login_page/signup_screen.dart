import 'package:aplikasi_jasa_sewa_laptop/login_page/login_screen.dart';
import 'package:aplikasi_jasa_sewa_laptop/styles.dart';
import 'package:aplikasi_jasa_sewa_laptop/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyles.title.copyWith(
            fontSize: 25.0,
            color: AppColors.darkGrey,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login_ui0.png'),
              const SizedBox(height: 24.0),
              Text(
                'Sign Up Details',
                style: TextStyles.title.copyWith(
                  color: AppColors.darkGrey,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hint: 'Email or Username',
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                hint: 'Password',
                isObscure: isObscure,
                hasSuffix: true,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () async {
                  // Ambil teks dari controller
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    // 2. Akses Box Hive
                    var userBox = Hive.box('userBox');

                    // 3. Simpan data (Key: Email, Value: Password)
                    // Kita gunakan email sebagai kunci unik untuk tiap user
                    await userBox.put(email, password);

                    // 4. Beri Notifikasi Sukses
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Akun berhasil dibuat! Silakan Login.'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // 5. Arahkan ke Halaman Login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  } else {
                    // Validasi jika input kosong
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email dan Password wajib diisi!'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyles.title.copyWith(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
