import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/controllers/pedidos_controller.dart';
import 'package:sti3_app/app/models/pagamento_model.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/app/models/produto_model.dart';
import 'package:sti3_app/app/view/pedido/components/button_consultar.dart';
import 'package:sti3_app/app/view/pedido/components/card_pagamentos.dart';
import 'package:sti3_app/app/view/pedido/components/card_pedidos.dart';
import 'package:sti3_app/app/view/pedido/components/card_produtos.dart';
import 'package:sti3_app/app/view/pedido/components/detalhes_pedido.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/text_field_search_pedidos.dart';
import 'package:sti3_app/app/view/pedido/states/pedidos_page_state.dart';
import 'package:sti3_app/app/view/widgets/custom_drawer_widget.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  Pedido? pedidoSelected;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PedidosController>().value;
    Widget child = Container();
    final mediaQuery = MediaQuery.of(context);
    final heightScreen = mediaQuery.size.height -
        (AppBar().preferredSize.height +
            mediaQuery.padding.top -
            mediaQuery.padding.bottom);

    Future<void> showInformations(BuildContext context, List<Produto> produtos,
        List<Pagamento> pagamentos) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Detalhes do pedido',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardProdutos(
                  produtos: produtos,
                  height: heightScreen * 0.35,
                ),
                CardPagamentos(
                  pagamentos: pagamentos,
                  height: heightScreen * 0.35,
                ),
              ],
            ),
          );
        },
      );
    }

    if (state is LoadingPedidosState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuccessPedidosState) {
      final pedidos = state.pedidos;

      child = ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          final dataFormatada =
              DateFormat('dd/MM/yyyy').format(pedidos[index].dataCriacao);

          final color = pedidos[index].status == "CANCELADO"
              ? Colors.red
              : Theme.of(context).colorScheme.primary;

          return Container(
            color: pedidoSelected == pedidos[index]
                ? const Color.fromRGBO(34, 154, 167, 0.397)
                : Colors.transparent,
            height: 45,
            child: GestureDetector(
              onTap: () {
                setState(() => pedidoSelected = pedidos[index]);
              },
              onDoubleTap: () => showInformations(
                context,
                pedidos[index].produtos,
                pedidos[index].pagamentos,
              ),
              child: Row(
                children: [
                  ItemList(
                    item: pedidos[index].numero.toString(),
                    color: color,
                  ),
                  ItemList(
                    item: dataFormatada,
                    color: color,
                  ),
                  ItemList(
                    item: pedidos[index].cliente.nome,
                    color: color,
                  ),
                  ItemList(
                    item: pedidos[index].status,
                    color: color,
                  ),
                  ItemList(
                    item: "R\$ ${pedidos[index].valorTotal.toStringAsFixed(2)}",
                    color: color,
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (state is ErrorPedidosState) {}

    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        title: const Text("PEDIDOS STI3"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ButtonConsultar(),
                const TextFieldSearchPedidos(),
                CardPedidos(child: child),
                DetalhesPedido(pedido: pedidoSelected),
              ],
            ),
          )
        ],
      ),
    );
  }
}
