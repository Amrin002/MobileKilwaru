import 'package:go_router/go_router.dart';
import 'package:layanan_desa/features/auth/screens/login_screen.dart';
import 'package:layanan_desa/features/auth/screens/register_screen.dart';
import 'package:layanan_desa/features/home/screens/home_screen.dart';

// Gunakan class ini untuk menghindari kesalahan pengetikan nama rute
class AppRoutes {
  static const String login = '/login';
  static const String home = '/'; // Rute '/' biasanya untuk home
  static const String register = '/register';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login, // Rute awal saat aplikasi dibuka
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    // --- Tambahkan rute baru di sini ---
    // Contoh:
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => const ProfileScreen(),
    // ),
  ],
  // Opsional: Error page jika rute tidak ditemukan
  // errorBuilder: (context, state) => const Text('Error: Page not found'),
);
