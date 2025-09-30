import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layanan_desa/core/routes/app_router.dart';

class RegisterViewModel extends ChangeNotifier {
  final nikController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> register(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    // Simulasi proses registrasi
    await Future.delayed(const Duration(seconds: 2));

    // --- LOGIKA VALIDASI DUMMY ---
    if (passwordController.text != confirmPasswordController.text) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Password dan Konfirmasi Password tidak cocok!'),
        ),
      );
    } else {
      // Jika berhasil
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Registrasi Berhasil! Silakan login.'),
        ),
      );
      // Arahkan kembali ke halaman login setelah berhasil
      context.go(AppRoutes.login);
    }

    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nikController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
