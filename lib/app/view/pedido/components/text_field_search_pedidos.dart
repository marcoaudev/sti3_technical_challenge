import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/controllers/pedidos_controller.dart';
import 'package:sti3_app/app/view/pedido/states/pedidos_page_state.dart';
import 'package:sti3_app/app/view/widgets/custom_text_field_widget.dart';

class TextFieldSearchPedidos extends StatefulWidget {
  const TextFieldSearchPedidos({
    super.key,
  });

  @override
  State<TextFieldSearchPedidos> createState() => _TextFieldSearchPedidosState();
}

class _TextFieldSearchPedidosState extends State<TextFieldSearchPedidos> {
  String nomeCliente = "";

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PedidosController>().value;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFieldWidget(
            hint: "Pesquise pelo nome do Cliente",
            width: MediaQuery.of(context).size.width * 0.7,
            // onChanged: (p0) => context.read<PedidosController>().searchPedidosFromName(nome: p0), Maneira para pegar cada digitação do usuário e já realizar a consulta
            onChanged: (p0) {
              setState(() => nomeCliente = p0);
            },
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.2,
            child: ElevatedButton(
              onPressed: () {
                if(state is SuccessPedidosState){
                  context.read<PedidosController>().searchPedidosFromName(nome: nomeCliente);
                }
              },
              child: const SizedBox(
                child: Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
