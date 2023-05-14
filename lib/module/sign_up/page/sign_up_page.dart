import 'package:enem_prep_pro/core/auth/auth_controller.dart';
import 'package:enem_prep_pro/core/style/app_colors.dart';
import 'package:enem_prep_pro/core/widgets/pro_button.dart';
import 'package:enem_prep_pro/core/widgets/pro_text_form_field.dart';
import 'package:enem_prep_pro/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.YELLOW,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Criar conta',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Entre, desafie-se e prepare-se para brilhar no ENEM!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProTextFormField(
                    label: 'Nome',
                    keyboardType: TextInputType.name,
                    controller: widget.authController.nameController,
                  ),
                  const SizedBox(height: 30),
                  ProTextFormField(
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: widget.authController.emailController,
                  ),
                  const SizedBox(height: 30),
                  ProTextFormField(
                    label: 'Senha',
                    keyboardType: TextInputType.emailAddress,
                    controller: widget.authController.passwordController,
                  ),
                  const SizedBox(height: 40),
                  ValueListenableBuilder(
                    valueListenable: widget.authController.authState,
                    builder: (context, state, child) {
                      return ProButton(
                        label: 'CRIAR CONTA',
                        onPressed: () {
                          widget.authController.signUp();
                          if (state == AuthState.success) {
                            Modular.to.pushReplacementNamed(Routes.home);
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
