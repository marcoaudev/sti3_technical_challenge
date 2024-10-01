import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/view/relatorio/states/card_totalizacao_forma_pagamento_dia_state.dart';

class CardTotalizacaoFormaPagamentoDiaStore extends ValueNotifier<CardTotalizacaoFormaPagamentoDiaState>{
  final RelatorioController controller;

  CardTotalizacaoFormaPagamentoDiaStore(this.controller) : super(InitialCardTotalizacaoFormaPagamentoDiaState());

  void fetchTotalizaoFormaPagamentoDia(){
    value = LoadingCardTotalizacaoFormaPagamentoDiaState();
    try{
      final estatisticas = controller.totalizacaoFormaPagamentoPorDia();
      value = SuccessCardTotalizacaoFormaPagamentoDiaState(estatisticas: estatisticas);
    }catch(e){
      value = ErrorCardTotalizacaoFormaPagamentoDiaState(error: "Houve um erro!");
    }
    
  }
}