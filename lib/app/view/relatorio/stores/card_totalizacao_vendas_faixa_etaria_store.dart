import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_vendas_faixa_etaria_state.dart';

class CardTotalizacaoVendasFaixaEtariaStore extends ValueNotifier<CardTotalizacaoVendasFaixaEtariaState>{
  final RelatorioController controller;

  CardTotalizacaoVendasFaixaEtariaStore(this.controller) : super(InitialCardTotalizacaoVendasFaixaEtariaState());

  void fetchTotalizaoVendasPorFaixaEtaria(){
    value = LoadingCardTotalizacaoVendasFaixaEtariaState();
    try{
      final estatisticas = controller.totalizacaoVendasPorFaixaEtaria();
      value = SuccessCardTotalizacaoVendasFaixaEtariaState(estatisticas: estatisticas);
    }catch(e){
      value = ErrorCardTotalizacaoVendasFaixaEtariaState(error: "Houve um erro!");
    }
    
  }
}