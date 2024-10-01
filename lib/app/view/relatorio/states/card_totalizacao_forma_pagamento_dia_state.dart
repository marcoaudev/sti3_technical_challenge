abstract class CardTotalizacaoFormaPagamentoDiaState {}

class InitialCardTotalizacaoFormaPagamentoDiaState extends CardTotalizacaoFormaPagamentoDiaState{}
class LoadingCardTotalizacaoFormaPagamentoDiaState extends CardTotalizacaoFormaPagamentoDiaState{}
class SuccessCardTotalizacaoFormaPagamentoDiaState extends CardTotalizacaoFormaPagamentoDiaState{
  final List<Map> estatisticas;

  SuccessCardTotalizacaoFormaPagamentoDiaState({required this.estatisticas});
}
class ErrorCardTotalizacaoFormaPagamentoDiaState extends CardTotalizacaoFormaPagamentoDiaState{
   final String error;

  ErrorCardTotalizacaoFormaPagamentoDiaState({required this.error});
}