import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/relatorio/states/card_produtos_mais_vendidos_state.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_produtos_mais_vendidos_store.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardProdutosMaisVendidos extends StatefulWidget {
  const CardProdutosMaisVendidos({super.key});

  @override
  State<CardProdutosMaisVendidos> createState() => _CardProdutosMaisVendidosState();
}

class _CardProdutosMaisVendidosState extends State<CardProdutosMaisVendidos> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CardProdutosMaisVendidosStore>().fetchProdutosMaisVendidos();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final state = context.watch<CardProdutosMaisVendidosStore>().value;
    Widget list = Container();

    if (state is SuccessCardProdutosMaisVendidosState) {
      final estatisticas = state.estatisticas;

      list = Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemCount: estatisticas.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 45,
              child: Row(
                children: [
                  ItemList(item: estatisticas[index]['nome']),
                  ItemList(item: estatisticas[index]['quantidade'].toString()),
                  ItemList(item: "R\$ ${estatisticas[index]['valorMedio'].toStringAsFixed(2)}"),
                ],
              ),
            );
          },
        ),
      );
    }
    
    return CustomCardWidget(
      child: Column(
        children: [
          const TableLegends(
            legends: ["Produto", "Quantidade", "Valor Médio"],
          ),
          list
        ],
      ),
    );
  }
}
