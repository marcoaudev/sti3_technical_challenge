import 'package:flutter/material.dart';
import 'package:sti3_app/app/models/produto_model.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardProdutos extends StatelessWidget {
  final List<Produto> produtos;
  final double height;

  const CardProdutos({
    super.key,
    required this.produtos,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return CustomCardWidget(
      child: SizedBox(
        width: widthScreen * 0.95,
        height: height,
        child: Column(
          children: [
            Text(
              "Produtos",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const TableLegends(
              legends: [
                "Produto",
                "QTD",
                "Valor unitário",
              ],
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        ItemList(item: produtos[index].nome),
                        ItemList(item: produtos[index].quantidade.toString()),
                        ItemList(item: "R\$ ${produtos[index].valorUnitario}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
