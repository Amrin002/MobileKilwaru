import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // <-- 1. Tambahkan import ini
import 'package:layanan_desa/core/routes/app_router.dart'; // <-- 2. Tambahkan import ini

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    String email = emailController.text;
    String password = passwordController.text;

    if (email == 'admin@gmail.com' && password == 'password123') {
      if (!context.mounted) return;
      // 3. Ganti SnackBar dengan navigasi ke halaman home
      context.go(AppRoutes.home);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('NIK/Email atau Password salah!'),
        ),
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
