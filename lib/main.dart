//* IMPORTACIONES PROPIAS DE FLUTTER
import 'package:flutter/material.dart';

//* IMPORTACIONES DE LIBRERIAS
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

//* IMPORTACIONES PROPIAS
import 'package:test_logrant/data/global_preferences.dart';
import 'package:test_logrant/routes/routes_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final globalPrefs = GlobalPreferences();
  await globalPrefs.initVarsPermanentes();
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
      initialRoute: '/login_view',
      getPages: RoutesApp.routes
    );
  }
}
