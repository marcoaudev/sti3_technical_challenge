import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/view/relatorio/components/grafico_top_produtos.dart';
import 'package:sti3_app/app/view/relatorio/states/card_grafico_top_produtos_state.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_grafico_top_produtos_store.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardGraficoTopProdutos extends StatefulWidget {
  const CardGraficoTopProdutos({super.key});

  @override
  State<CardGraficoTopProdutos> createState() => _CardGraficoTopProdutosState();
}

class _CardGraficoTopProdutosState extends State<CardGraficoTopProdutos> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CardGraficoTopProdutosStore>().fetchTopProdutos();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CardGraficoTopProdutosStore>().value;
    List<ChartData> data = [];

    if (state is SuccessCardGraficoTopProdutosState) {
      final estatisticas = state.estatisticas;

      data = estatisticas.map((e) {
        return ChartData(e['nome'], e['quantidade']);
      }).toList();
    }

    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top produtos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Text(
                  "Produtos mais vendidos",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: Visibility(
              visible: data.isEmpty,
              replacement: GraficoTopProdutos(
                chartData: data,
              ),
              child: const Center(
                child: Text("Ainda não há dados"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
