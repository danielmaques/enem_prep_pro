import 'package:enem_prep_pro/core/auth/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/auth/auth_datasource.dart';
import 'core/auth/auth_service.dart';
import 'core/auth/auth_usecase.dart';
import 'firebase_options.dart';
import 'module/login/page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
          color: Colors.white,
        )),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: const Color(0xFF191B1F),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(
        authController: AuthController(
          AuthService(
            AuthUseCase(
              AuthDataSource(),
            ),
          ),
        ),
      ),
    );
  }
}
