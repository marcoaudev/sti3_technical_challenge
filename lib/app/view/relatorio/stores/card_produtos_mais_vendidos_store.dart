import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/view/relatorio/states/card_produtos_mais_vendidos_state.dart';

class CardProdutosMaisVendidosStore extends ValueNotifier<CardProdutosMaisVendidosState>{
  final RelatorioController controller;

  CardProdutosMaisVendidosStore(this.controller) : super(InitialCardProdutosMaisVendidosState());

  void fetchProdutosMaisVendidos(){
    value = LoadingCardProdutosMaisVendidosState();
    try{
      final estatisticas = controller.fetchlistagemProdutoMaisVendidos();
      value = SuccessCardProdutosMaisVendidosState(estatisticas: estatisticas);
    }catch(e){
      value = ErrorCardProdutosMaisVendidosState(error: "Houve um erro!");
    }
    
  }
}