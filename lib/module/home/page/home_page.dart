import 'package:enem_prep_pro/module/home/widgets/questions_tile_widget.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController(DateTime(2023, 12, 05));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ENEMPrepPro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF191B1F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            ValueListenableBuilder(
              valueListenable: controller.remainingDays,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Text(
                      value.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Dias ate o Enem',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF252A34),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    QuestionsTile(
                      text: 'Ciências da Natureza',
                    ),
                    SizedBox(height: 20),
                    QuestionsTile(
                      text: 'Ciências Humanas',
                    ),
                    SizedBox(height: 20),
                    QuestionsTile(
                      text: 'Linguagens',
                    ),
                    SizedBox(height: 20),
                    QuestionsTile(
                      text: 'Matemática',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
