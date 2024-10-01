import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_vendas_cidade_state.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_vendas_cidade_store.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardTotalizacaoVendasCidade extends StatefulWidget {
  const CardTotalizacaoVendasCidade({super.key});

  @override
  State<CardTotalizacaoVendasCidade> createState() => _CardTotalizacaoVendasCidadeState();
}

class _CardTotalizacaoVendasCidadeState extends State<CardTotalizacaoVendasCidade> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CardTotalizacaoVendasCidadeStore>().fetchTotalizaoVendasPorCidade();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CardTotalizacaoVendasCidadeStore>().value;
    Widget list = Container();

    if (state is SuccessCardTotalizacaoVendasCidadeState) {
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
                  ItemList(item: estatisticas[index]['cidade']),
                  ItemList(item: estatisticas[index]['quantidade'].toString()),
                  ItemList(item: "R\$ ${estatisticas[index]['valorTotal'].toStringAsFixed(2)}"),
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
            legends: ["Cidade", "Quantidade dos Pedidos", "Valor Total"],
          ),
          list
        ],
      ),
    );
  }
}
