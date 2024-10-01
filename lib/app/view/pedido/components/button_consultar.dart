import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/controllers/pedidos_controller.dart';
import 'package:sti3_app/app/view/widgets/custom_buttom_widget.dart';

class ButtonConsultar extends StatelessWidget {
  const ButtonConsultar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: CustomButtomWidget(
        onPressed: context.read<PedidosController>().consultarPedidos,
        title: "Consultar",
      ),
    );
  }
}