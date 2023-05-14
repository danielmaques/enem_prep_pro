import 'package:enem_prep_pro/core/auth/auth_controller.dart';
import 'package:enem_prep_pro/module/sign_up/page/sign_up_page.dart';
import 'package:enem_prep_pro/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/auth/auth_service.dart';
import 'firebase_options.dart';
import 'module/home/page/home_page.dart';
import 'module/login/page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(module: AppModule(), child: const AppWidget()),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>
              LoginPage(authController: AuthController(AuthService())),
        ),
        ChildRoute(Routes.createUser,
            child: (context, args) =>
                SignUpPage(authController: AuthController(AuthService()))),
        ChildRoute(
          Routes.home,
          child: (context, args) => const HomePage(),
        )
      ];
}
