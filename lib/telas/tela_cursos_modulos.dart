import 'package:flutter/material.dart';

class TelaCursosModulos extends StatelessWidget {
  const TelaCursosModulos({super.key});

  static const cursos = [
    {
      'titulo': 'Formação de Motoristas Profissionais',
      'subtitulo': 'Carreteiros e Caminhões',
      'imagem': 'assets/imagens/cursos/01_motoristas_profissionais_fundo.png',
    },
    {
      'titulo': 'Transporte Coletivo de Passageiros',
      'subtitulo': 'Urbano, Rodoviário e Fretamento',
      'imagem': 'assets/imagens/cursos/02_transporte_coletivo_fundo.png',
    },
    {
      'titulo': 'Transporte Escolar',
      'subtitulo': 'Segurança e Legislação',
      'imagem': 'assets/imagens/cursos/03_transporte_escolar_fundo.png',
    },
    {
      'titulo': 'Produtos Perigosos (MOPP)',
      'subtitulo': 'Transporte de Cargas',
      'imagem': 'assets/imagens/cursos/04_mopp_fundo.png',
    },
    {
      'titulo': 'Veículos de Emergência',
      'subtitulo': 'Condução e Procedimentos',
      'imagem': 'assets/imagens/cursos/05_emergencia_fundo.png',
    },
    {
      'titulo': 'Carga Indivisível',
      'subtitulo': 'Normas e Autorização Especial',
      'imagem': 'assets/imagens/cursos/06_carga_indivisivel_fundo.png',
    },
    {
      'titulo': 'Mototaxista / Motofretista',
      'subtitulo': 'Legislação e Segurança',
      'imagem': 'assets/imagens/cursos/07_mototaxista_fundo.png',
    },
    {
      'titulo': 'Agente de Trânsito',
      'subtitulo': 'Formação e Atualização',
      'imagem': 'assets/imagens/cursos/08_agente_transito_fundo.png',
    },
    {
      'titulo': 'Atualizações / Reciclagens',
      'subtitulo': 'Cursos e Treinamentos',
      'imagem': 'assets/imagens/cursos/09_atualizacoes_fundo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF172A3A),
        foregroundColor: Colors.white,
        title: const Text(
          'Cursos e Módulos',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                'EXPERIÊNCIA • Trânsito e Transporte',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final colunas = constraints.maxWidth >= 1200
              ? 4
              : constraints.maxWidth >= 850
              ? 3
              : constraints.maxWidth >= 550
              ? 2
              : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nossos Cursos e Módulos',
                  style: TextStyle(
                    color: Color(0xFF172A3A),
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Formação, capacitação, atualização e avaliação de profissionais do trânsito e transporte.',
                  style: TextStyle(color: Color(0xFF66727C), fontSize: 15),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 78,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD71920),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 26),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cursos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: colunas,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.35,
                  ),
                  itemBuilder: (context, index) {
                    final curso = cursos[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Abrindo: ${curso['titulo']}'),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE0E4E8)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x10000000),
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  curso['imagem']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                15,
                                13,
                                15,
                                14,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    curso['titulo']!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF172A3A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    curso['subtitulo']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF74808A),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
