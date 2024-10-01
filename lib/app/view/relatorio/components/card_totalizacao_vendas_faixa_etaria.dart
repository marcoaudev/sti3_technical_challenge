import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_vendas_faixa_etaria_state.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_vendas_faixa_etaria_store.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardTotalizacaoVendasFaixaEtaria extends StatefulWidget {
  const CardTotalizacaoVendasFaixaEtaria({super.key});

  @override
  State<CardTotalizacaoVendasFaixaEtaria> createState() => _CardTotalizacaoVendasFaixaEtariaState();
}

class _CardTotalizacaoVendasFaixaEtariaState extends State<CardTotalizacaoVendasFaixaEtaria> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CardTotalizacaoVendasFaixaEtariaStore>().fetchTotalizaoVendasPorFaixaEtaria();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CardTotalizacaoVendasFaixaEtariaStore>().value;
    Widget list = Container();

    if (state is SuccessCardTotalizacaoVendasFaixaEtariaState) {
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
                  ItemList(item: estatisticas[index]['faixaEtaria']),
                  ItemList(item: estatisticas[index]['quantidadePedidos'].toString()),
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
            legends: ["Faixa Etária", "Quantidade dos Pedidos", "Valor Total"],
          ),
          list
        ],
      ),
    );
  }
}
