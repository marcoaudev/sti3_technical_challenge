import 'package:flutter/material.dart';
import 'package:sti3_app/app/view/pedido/components/table_legends.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class CardPedidos extends StatelessWidget {
  const CardPedidos({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: SizedBox(
        child: Column(
          children: [
            const TableLegends(
              legends: [
                "Número",
                "Data",
                "Cliente",
                "Status",
                "Valor total",
              ],
            ),
            SizedBox(
              height: 460,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}