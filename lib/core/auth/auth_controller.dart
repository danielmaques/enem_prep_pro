import 'package:flutter/cupertino.dart';

import 'auth_service.dart';

class AuthController {
  final AuthService authService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  AuthController(this.authService);

  Future<void> signUp() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String name = nameController.text.trim();

    await authService.signUpWithEmailAndPassword(email, password, name);
  }

  Future<void> signIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    await authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}
