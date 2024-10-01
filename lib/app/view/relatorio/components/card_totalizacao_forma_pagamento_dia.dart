import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_forma_pagamento_dia_state.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_forma_pagamento_dia.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardTotalizacaoFormaPagamentoDia extends StatefulWidget {
  const CardTotalizacaoFormaPagamentoDia({super.key});

  @override
  State<CardTotalizacaoFormaPagamentoDia> createState() => _CardTotalizacaoFormaPagamentoDiaState();
}

class _CardTotalizacaoFormaPagamentoDiaState extends State<CardTotalizacaoFormaPagamentoDia> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CardTotalizacaoFormaPagamentoDiaStore>().fetchTotalizaoFormaPagamentoDia();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final state = context.watch<CardTotalizacaoFormaPagamentoDiaStore>().value;
    Widget list = Container();

    if (state is SuccessCardTotalizacaoFormaPagamentoDiaState) {
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
                  ItemList(item: estatisticas[index]['data']),
                  ItemList(item: estatisticas[index]['formaPagamento']),
                  ItemList(item: "R\$ ${estatisticas[index]['valor'].toStringAsFixed(2)}"),
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
            legends: ["Data", "Forma", "Valor"],
          ),
          list
        ],
      ),
    );
  }
}
