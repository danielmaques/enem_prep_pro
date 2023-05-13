import 'package:enem_prep_pro/core/auth/auth_controller.dart';
import 'package:enem_prep_pro/core/style/app_colors.dart';
import 'package:enem_prep_pro/core/widgets/custom_appbar.dart';
import 'package:enem_prep_pro/core/widgets/pro_button.dart';
import 'package:enem_prep_pro/core/widgets/pro_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.YELLOW,
      appBar: const CustomAppBar(
        text: 'EnemPrepPro',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Faça login e prepare-se para o Enem com o nosso app!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  const SizedBox(height: 90),
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
                  ProButton(
                    label: 'ENTRAR',
                    onPressed: () {
                      widget.authController.signIn();
                    },
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'CRIAR CONTA',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
