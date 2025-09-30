import 'package:flutter/material.dart';
import 'package:layanan_desa/core/routes/app_router.dart'; // Import router kita
import 'package:layanan_desa/features/auth/viewmodels/register_viewmodel.dart';
import 'package:provider/provider.dart';
import 'features/auth/viewmodels/login_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Gunakan MultiProvider jika nanti ada banyak ViewModel
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        // Tambahkan provider lain di sini
      ],
      child: MaterialApp.router(
        title: 'Layanan Desa',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        // Gunakan routerConfig dari go_router
        routerConfig: router,
      ),
    );
  }
}
