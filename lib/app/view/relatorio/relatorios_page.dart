import 'package:flutter/material.dart';
import 'package:sti3_app/app/view/relatorio/components/card_grafico_top_produtos.dart';
import 'package:sti3_app/app/view/relatorio/components/card_produtos_mais_vendidos.dart';
import 'package:sti3_app/app/view/relatorio/components/card_totalizacao_forma_pagamento_dia.dart';
import 'package:sti3_app/app/view/relatorio/components/card_totalizacao_vendas_cidade.dart';
import 'package:sti3_app/app/view/relatorio/components/card_totalizacao_vendas_faixa_etaria.dart';
import 'package:sti3_app/app/view/widgets/custom_card_widget.dart';
import 'package:sti3_app/app/view/widgets/custom_drawer_widget.dart';

class RelatoriosPage extends StatefulWidget {
  const RelatoriosPage({super.key});

  @override
  State<RelatoriosPage> createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  int? valueSeleted;

  @override
  Widget build(BuildContext context) {
    Widget card = Container();

    switch (valueSeleted) {
      case 1:
        card = const CardProdutosMaisVendidos();
      case 2:
        card = const CardTotalizacaoFormaPagamentoDia();
      case 3:
        card = const CardTotalizacaoVendasCidade();
      case 4:
        card = const CardTotalizacaoVendasFaixaEtaria();
      default:
        card = CustomCardWidget(child: Container(),);
    }

    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        title: const Text("RELATÓRIOS STI3"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                child: DropdownButtonFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  isExpanded: true,
                  value: valueSeleted,
                  hint: const Text("Selecione o tipo de relatório"),
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Listagem de produtos mais vendidos"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Totalização de Formas de Pagamento por Dia"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Totalização de Vendas por Cidade"),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text("Totalização de Vendas por Faixa Etária"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() => valueSeleted = value);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: card,
            ),
            const CardGraficoTopProdutos(),
          ],
        ),
      ),
    );
  }
}
