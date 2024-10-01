abstract class CardTotalizacaoVendasFaixaEtariaState {}

class InitialCardTotalizacaoVendasFaixaEtariaState extends CardTotalizacaoVendasFaixaEtariaState{}
class LoadingCardTotalizacaoVendasFaixaEtariaState extends CardTotalizacaoVendasFaixaEtariaState{}
class SuccessCardTotalizacaoVendasFaixaEtariaState extends CardTotalizacaoVendasFaixaEtariaState{
  final List<Map> estatisticas;

  SuccessCardTotalizacaoVendasFaixaEtariaState({required this.estatisticas});
}
class ErrorCardTotalizacaoVendasFaixaEtariaState extends CardTotalizacaoVendasFaixaEtariaState{
   final String error;

  ErrorCardTotalizacaoVendasFaixaEtariaState({required this.error});
}