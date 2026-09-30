import 'package:flutter/material.dart';

void main() {
  runApp(const ExperienciaApp());
}

class ExperienciaApp extends StatelessWidget {
  const ExperienciaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXPERIÊNCIA - Trânsito e Transporte',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: const PainelExperiencia(),
    );
  }
}

class PainelExperiencia extends StatelessWidget {
  const PainelExperiencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;
          final alturaPainel = largura * (1024 / 1536);

          return SingleChildScrollView(
            child: SizedBox(
              width: largura,
              height: alturaPainel,
              child: Image.asset(
                'assets/imagens/painel/painel_experiencia_referencia.png',
                width: largura,
                height: alturaPainel,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
          );
        },
      ),
    );
  }
}
