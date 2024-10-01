import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_vendas_cidade_state.dart';

class CardTotalizacaoVendasCidadeStore extends ValueNotifier<CardTotalizacaoVendasCidadeState>{
  final RelatorioController controller;

  CardTotalizacaoVendasCidadeStore(this.controller) : super(InitialCardTotalizacaoVendasCidadeState());

  void fetchTotalizaoVendasPorCidade(){
    value = LoadingCardTotalizacaoVendasCidadeState();
    try{
      final estatisticas = controller.totalizacaoVendasPorCidade();
      value = SuccessCardTotalizacaoVendasCidadeState(estatisticas: estatisticas);
    }catch(e){
      value = ErrorCardTotalizacaoVendasCidadeState(error: "Houve um erro!");
    }
    
  }
}