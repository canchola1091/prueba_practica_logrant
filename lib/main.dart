//* IMPORTACIONES PROPIAS DE FLUTTER
import 'package:flutter/material.dart';

//* IMPORTACIONES DE LIBRERIAS
import 'package:get/get.dart';

//* IMPORTACIONES DE VISTAS
import 'package:test_logrant/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Logrant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LoginView()
    );
  }
}
