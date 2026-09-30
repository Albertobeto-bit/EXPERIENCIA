import 'package:flutter/material.dart';

class TelaNovaAvaliacao extends StatefulWidget {
  const TelaNovaAvaliacao({super.key});

  @override
  State<TelaNovaAvaliacao> createState() => _TelaNovaAvaliacaoState();
}

class _TelaNovaAvaliacaoState extends State<TelaNovaAvaliacao> {
  final nome = TextEditingController();
  final cnh = TextEditingController();
  final validade = TextEditingController();
  final categoria = TextEditingController();
  final data = TextEditingController();
  final trocasMarchas = TextEditingController();
  final utilizacaoFreios = TextEditingController();
  final comentarios = TextEditingController();

  String tipo = 'Funcionário';

  final List<String> itens = [
    'Dificuldade de controlar o veículo na via (inexperiência)',
    'Falha na sincronização de marcha',
    'Iniciar o movimento com a marcha inadequada',
    'Repicar o acelerador nas trocas de marchas',
    'Manter o pé apoiado no pedal de freio sem necessidade',
    'Manter o pé na embreagem para passar lombada',
    'Manter o pé na embreagem enquanto conduz o veículo',
    'Transitar o veículo em ponto morto',
    'Liberar o freio estacionário de forma inadequada',
    'Pegar o volante por dentro nas conversões',
    'Não manter as duas mãos ao volante',
    'Desrespeitar a velocidade ou sinalizações no trânsito',
    'Exceder a velocidade da via',
    'Não utilizar as luzes de advertência (seta)',
    'Flutuar entre as faixas de condução',
    'Deixar de exigir e conferir o uso do cinto de segurança',
    'Não utilizar a buzina, ou usá-la incorretamente',
    'Abrir ou fechar demais nas conversões',
    'Forçar passagens ou manobras desnecessárias',
  ];

  final Map<int, String?> classificacoes = {};

  Color corClassificacao(String valor) {
    switch (valor) {
      case 'L':
        return Colors.green;
      case 'M':
        return Colors.orange;
      case 'G':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  void dispose() {
    nome.dispose();
    cnh.dispose();
    validade.dispose();
    categoria.dispose();
    data.dispose();
    trocasMarchas.dispose();
    utilizacaoFreios.dispose();
    comentarios.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF172A3A),
        foregroundColor: Colors.white,
        title: const Text(
          'Nova Avaliação Prática',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ficha Individual — Avaliação do Motorista',
                  style: TextStyle(
                    color: Color(0xFF172A3A),
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'EXPERIÊNCIA • Trânsito e Transporte',
                  style: TextStyle(color: Color(0xFF66727C), fontSize: 14),
                ),
                const SizedBox(height: 24),

                _card(
                  titulo: 'Identificação',
                  icone: Icons.badge_outlined,
                  child: Column(
                    children: [
                      TextField(
                        controller: nome,
                        decoration: const InputDecoration(
                          labelText: 'Nome do motorista',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            [
                              'Funcionário',
                              'Contratado',
                              'Parente',
                              'Escolhinha',
                            ].map((opcao) {
                              return ChoiceChip(
                                label: Text(opcao),
                                selected: tipo == opcao,
                                onSelected: (_) {
                                  setState(() => tipo = opcao);
                                },
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: cnh,
                              decoration: const InputDecoration(
                                labelText: 'Nº CNH',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: validade,
                              decoration: const InputDecoration(
                                labelText: 'Validade',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: categoria,
                              decoration: const InputDecoration(
                                labelText: 'Categoria',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: data,
                              decoration: const InputDecoration(
                                labelText: 'Data',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                _card(
                  titulo: 'Técnicas de Condução',
                  icone: Icons.directions_car,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Marque somente quando houver apontamento.',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              'L = Leve   M = Média   G = Grave',
                              style: TextStyle(
                                color: Color(0xFF66727C),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(itens.length, (index) {
                        final atual = classificacoes[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE1E5E8)),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F3F5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  itens[index],
                                  style: const TextStyle(
                                    color: Color(0xFF263746),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ...['L', 'M', 'G'].map((valor) {
                                final selecionado = atual == valor;

                                return Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        classificacoes[index] = selecionado
                                            ? null
                                            : valor;
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 38,
                                      height: 34,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: selecionado
                                            ? corClassificacao(valor)
                                            : const Color(0xFFF0F2F4),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        valor,
                                        style: TextStyle(
                                          color: selecionado
                                              ? Colors.white
                                              : const Color(0xFF5C6872),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                _card(
                  titulo: 'Observações da Avaliação',
                  icone: Icons.description_outlined,
                  child: Column(
                    children: [
                      TextField(
                        controller: trocasMarchas,
                        decoration: const InputDecoration(
                          labelText: 'Trocas de marchas',
                          hintText: 'Registre os apontamentos observados',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: utilizacaoFreios,
                        decoration: const InputDecoration(
                          labelText: 'Utilização dos freios',
                          hintText: 'Registre os apontamentos observados',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: comentarios,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Comentários',
                          hintText: 'Observações gerais da avaliação prática',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFD71920),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 18,
                      ),
                    ),
                    onPressed: () async {
                      if (nome.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Informe o nome do motorista antes de salvar.',
                            ),
                          ),
                        );
                        return;
                      }

                      final apontamentos = classificacoes.entries
                          .where((e) => e.value != null)
                          .map(
                            (e) => {
                              'numero': e.key + 1,
                              'item': itens[e.key],
                              'classificacao': e.value!,
                            },
                          )
                          .toList();

                      final avaliacao = <String, dynamic>{
                        'nome': nome.text.trim(),
                        'tipo': tipo,
                        'cnh': cnh.text.trim(),
                        'validade': validade.text.trim(),
                        'categoria': categoria.text.trim(),
                        'data': data.text.trim(),
                        'apontamentos': apontamentos,
                        'trocasMarchas': trocasMarchas.text.trim(),
                        'utilizacaoFreios': utilizacaoFreios.text.trim(),
                        'comentarios': comentarios.text.trim(),
                      };

                      final instrutorController = TextEditingController();

                      final instrutor = await showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: const Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Color(0xFFD71920),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Instrutor Responsável',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            content: SizedBox(
                              width: 450,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Informe o nome do instrutor responsável pela avaliação. Este nome será incluído no relatório em PDF.',
                                  ),
                                  const SizedBox(height: 18),
                                  TextField(
                                    controller: instrutorController,
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: const InputDecoration(
                                      labelText:
                                          'Nome do instrutor responsável',
                                      hintText: 'Digite o nome completo',
                                      prefixIcon: Icon(Icons.badge_outlined),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFFD71920),
                                ),
                                onPressed: () {
                                  final nomeInstrutor = instrutorController.text
                                      .trim();

                                  if (nomeInstrutor.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Informe o nome do instrutor responsável.',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  Navigator.of(dialogContext)
                                      .pop(nomeInstrutor);
                                },
                                icon: const Icon(Icons.check),
                                label: const Text('Confirmar'),
                              ),
                            ],
                          );
                        },
                      );

                      instrutorController.dispose();

                      if (instrutor == null || instrutor.trim().isEmpty) {
                        return;
                      }

                      avaliacao['instrutorResponsavel'] = instrutor.trim();

                      if (!context.mounted) return;

                      Navigator.of(context).pop(avaliacao);
                    },
                    icon: const Icon(Icons.save_outlined),
                    label: const Text(
                      'Salvar Avaliação',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _card({
    required String titulo,
    required IconData icone,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E4E8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFD71920),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icone, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                titulo,
                style: const TextStyle(
                  color: Color(0xFF172A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}
