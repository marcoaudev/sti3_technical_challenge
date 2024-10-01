import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/view/relatorio/states/card_grafico_top_produtos_state.dart';

class CardGraficoTopProdutosStore extends ValueNotifier<CardGraficoTopProdutosState>{
  final RelatorioController controller;

  CardGraficoTopProdutosStore(this.controller) : super(InitialCardGraficoTopProdutosState());

  void fetchTopProdutos(){
    value = LoadingCardGraficoTopProdutosState();
    try{
      final estatisticas = controller.fetchlistagemProdutoMaisVendidos();
      value = SuccessCardGraficoTopProdutosState(estatisticas: estatisticas);
    }catch(e){
      value = ErrorCardGraficoTopProdutosState(error: "Houve um erro!");
    }
    
  }
}