import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';

class DetalhesPedido extends StatelessWidget {
  final Pedido? pedido;

  const DetalhesPedido({
    super.key,
    required this.pedido,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Detalhes do pedido",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (pedido == null)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nenhum pedido selecionado"),
                  ],
                ),
              if (pedido != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Title(title: "Informações do pedido"),
                    TextInfomation(
                      label: "Número",
                      information: pedido!.numero.toString(),
                    ),
                    TextInfomation(
                      label: "Data de criação",
                      information:
                          DateFormat('dd/MM/yyyy').format(pedido!.dataCriacao),
                    ),
                    TextInfomation(
                      label: "Data de alteração",
                      information: DateFormat('dd/MM/yyyy')
                          .format(pedido!.dataAlteracao),
                    ),
                    TextInfomation(
                      label: "Status",
                      information: pedido!.status,
                    ),
                    TextInfomation(
                      label: "Desconto",
                      information: "R\$ ${pedido!.desconto}",
                    ),
                    TextInfomation(
                      label: "Frete",
                      information: "R\$ ${pedido!.frete}",
                    ),
                    TextInfomation(
                      label: "Subtotal",
                      information: "R\$ ${pedido!.subTotal}",
                    ),
                    TextInfomation(
                      label: "Total",
                      information: "R\$ ${pedido!.valorTotal}",
                    ),
                    const Title(title: "Dados do cliente"),
                     TextInfomation(
                      label: "Cliente",
                      information: pedido!.cliente.nome,
                    ),
                     TextInfomation(
                      label: "CPF",
                      information: pedido!.cliente.cpf,
                    ),
                    TextInfomation(
                      label: "Data de nascimento",
                      information: DateFormat('dd/MM/yyyy')
                          .format(DateTime.parse(pedido!.cliente.dataNascimento)) ,
                    ),
                    TextInfomation(
                      label: "E-mail",
                      information: pedido!.cliente.email,
                    ),
                    const Title(title: "Local de entrega"),
                    TextInfomation(
                      label: "Endereço",
                      information: pedido!.enderecoEntrega.endereco,
                    ),
                    TextInfomation(
                      label: "Número",
                      information: pedido!.enderecoEntrega.numero,
                    ),
                    TextInfomation(
                      label: "CEP",
                      information: pedido!.enderecoEntrega.cep,
                    ),
                    TextInfomation(
                      label: "Bairro",
                      information: pedido!.enderecoEntrega.bairro,
                    ),
                    TextInfomation(
                      label: "Cidade",
                      information: pedido!.enderecoEntrega.cidade,
                    ),
                    TextInfomation(
                      label: "Estado",
                      information: pedido!.enderecoEntrega.estado,
                    ),
                    TextInfomation(
                      label: "Complemento",
                      information: pedido!.enderecoEntrega.complemento,
                    ),
                    TextInfomation(
                      label: "Referência",
                      information: pedido!.enderecoEntrega.referencia,
                    ),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 18,
        ),
      ),
    );
  }
}

class TextInfomation extends StatelessWidget {
  final String label;
  final String information;

  const TextInfomation({
    super.key,
    required this.label,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      child: Text(
        "$label: $information",
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
