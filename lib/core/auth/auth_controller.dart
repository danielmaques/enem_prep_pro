import 'package:flutter/cupertino.dart';

import 'auth_service.dart';

enum AuthState {
  success,
  failure,
}

class AuthController {
  final AuthService authService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ValueNotifier<AuthState> authState = ValueNotifier(AuthState.success);

  AuthController(this.authService);

  Future<void> signUp() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String name = nameController.text.trim();

    try {
      await authService.signUpWithEmailAndPassword(email, password, name);

      authState.value = AuthState.success;
    } catch (e) {
      authState.value = AuthState.failure;
    }
  }

  Future<void> signIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    try {
      await authService.signInWithEmailAndPassword(email, password);

      authState.value = AuthState.success;
    } catch (e) {
      authState.value = AuthState.failure;
    }
  }

  Future<void> signOut() async {
    await authService.signOut();
    authState.value = AuthState.success;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    authState.dispose();
  }
}
