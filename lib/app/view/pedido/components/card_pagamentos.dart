import 'package:flutter/material.dart';
import 'package:sti3_app/app/models/pagamento_model.dart';
import 'package:sti3_app/app/view/pedido/components/item_list.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardPagamentos extends StatelessWidget {
  final double height;
  final List<Pagamento> pagamentos;

  const CardPagamentos({
    super.key,
    required this.pagamentos,
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
              "Pagamentos",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const TableLegends(
              legends: [
                "Pagamento",
                "Parcela",
                "Valor",
              ],
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: pagamentos.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        ItemList(item: pagamentos[index].nome),
                        ItemList(item: pagamentos[index].parcela.toString()),
                        ItemList(item: "R\$ ${pagamentos[index].valor}"),
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
