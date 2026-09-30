import 'package:flutter/material.dart';

import 'telas/tela_cursos_modulos.dart';
import 'telas/tela_nova_avaliacao.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD71920)),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: const PainelExperiencia(),
    );
  }
}

class PainelExperiencia extends StatelessWidget {
  const PainelExperiencia({super.key});

  static const double larguraBase = 1536;
  static const double alturaBase = 1024;

  void abrir(BuildContext context, String titulo) {
    if (titulo == 'Cursos e Módulos') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const TelaCursosModulos()));
      return;
    }

    if (titulo == 'Nova Avaliação') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const TelaNovaAvaliacao()));
      return;
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => TelaInterna(titulo: titulo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;
          final escala = largura / larguraBase;
          final alturaPainel = alturaBase * escala;

          return SingleChildScrollView(
            child: SizedBox(
              width: largura,
              height: alturaPainel,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imagens/painel/painel_experiencia_referencia.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  ),

                  // MENU LATERAL
                  area(context, escala, 14, 173, 188, 42, 'Visão Geral'),
                  area(context, escala, 14, 220, 188, 42, 'Cursos e Módulos'),
                  area(context, escala, 14, 267, 188, 42, 'Alunos'),
                  area(context, escala, 14, 314, 188, 42, 'Instrutores'),
                  area(context, escala, 14, 361, 188, 42, 'Empresas'),
                  area(context, escala, 14, 408, 188, 42, 'Avaliação Prática'),
                  area(context, escala, 14, 455, 188, 42, 'Certificados'),
                  area(context, escala, 14, 502, 188, 42, 'Carteirinhas'),
                  area(context, escala, 14, 549, 188, 42, 'Planos e Licenças'),
                  area(context, escala, 14, 596, 188, 42, 'Financeiro'),
                  area(context, escala, 14, 643, 188, 42, 'Relatórios'),
                  area(context, escala, 14, 690, 188, 42, 'Configurações'),

                  // CABEÇALHO
                  area(context, escala, 1420, 18, 36, 55, 'Notificações'),
                  area(context, escala, 1457, 18, 36, 55, 'Configurações'),
                  area(context, escala, 1495, 18, 38, 55, 'Sair'),

                  // CURSOS
                  area(context, escala, 895, 246, 158, 38, 'Cursos e Módulos'),

                  area(
                    context,
                    escala,
                    226,
                    269,
                    197,
                    180,
                    'Formação de Motoristas Profissionais',
                  ),
                  area(
                    context,
                    escala,
                    434,
                    269,
                    197,
                    180,
                    'Transporte Coletivo de Passageiros',
                  ),
                  area(
                    context,
                    escala,
                    642,
                    269,
                    197,
                    180,
                    'Transporte Escolar',
                  ),
                  area(
                    context,
                    escala,
                    850,
                    269,
                    197,
                    180,
                    'Produtos Perigosos (MOPP)',
                  ),

                  area(
                    context,
                    escala,
                    226,
                    459,
                    155,
                    176,
                    'Veículos de Emergência',
                  ),
                  area(
                    context,
                    escala,
                    391,
                    459,
                    155,
                    176,
                    'Carga Indivisível',
                  ),
                  area(
                    context,
                    escala,
                    556,
                    459,
                    155,
                    176,
                    'Mototaxista / Motofretista',
                  ),
                  area(
                    context,
                    escala,
                    721,
                    459,
                    155,
                    176,
                    'Agente de Trânsito',
                  ),
                  area(
                    context,
                    escala,
                    886,
                    459,
                    155,
                    176,
                    'Atualizações / Reciclagens',
                  ),

                  // AVALIAÇÃO
                  area(
                    context,
                    escala,
                    1063,
                    459,
                    450,
                    258,
                    'Avaliação Prática',
                  ),

                  // NOVA AVALIACAO - PRIORIDADE DE CLIQUE
                  area(context, escala, 1375, 372, 138, 42, 'Nova Avaliação'),

                  // PORTAL DO INSTRUTOR
                  area(
                    context,
                    escala,
                    226,
                    657,
                    508,
                    329,
                    'Portal do Instrutor',
                  ),
                  area(context, escala, 462, 916, 252, 42, 'Solicitar acesso'),

                  // CERTIFICADOS E CARTEIRINHAS
                  area(
                    context,
                    escala,
                    746,
                    657,
                    491,
                    329,
                    'Certificados e Carteirinhas',
                  ),
                  area(
                    context,
                    escala,
                    767,
                    906,
                    211,
                    42,
                    'Gerar Certificado PDF',
                  ),
                  area(context, escala, 989, 906, 228, 42, 'Gerar Carteirinha'),

                  // REFERÊNCIAS
                  area(
                    context,
                    escala,
                    1248,
                    657,
                    265,
                    329,
                    'Referências Legais',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget area(
    BuildContext context,
    double escala,
    double x,
    double y,
    double largura,
    double altura,
    String destino,
  ) {
    return Positioned(
      left: x * escala,
      top: y * escala,
      width: largura * escala,
      height: altura * escala,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.white.withValues(alpha: 0.08),
          splashColor: Colors.white.withValues(alpha: 0.15),
          onTap: () {
            if (destino == 'Visão Geral') {
              return;
            }
            abrir(context, destino);
          },
        ),
      ),
    );
  }
}

class TelaInterna extends StatelessWidget {
  final String titulo;

  const TelaInterna({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF172A3A),
        foregroundColor: Colors.white,
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          width: 650,
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE0E4E8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundColor: Color(0xFFD71920),
                child: Icon(Icons.check_rounded, color: Colors.white, size: 42),
              ),
              const SizedBox(height: 20),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF172A3A),
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Botão funcionando corretamente.',
                style: TextStyle(color: Color(0xFF66727C), fontSize: 15),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFD71920),
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Voltar para Visão Geral'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
