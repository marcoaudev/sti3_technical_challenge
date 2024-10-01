abstract class CardTotalizacaoVendasCidadeState {}

class InitialCardTotalizacaoVendasCidadeState extends CardTotalizacaoVendasCidadeState{}
class LoadingCardTotalizacaoVendasCidadeState extends CardTotalizacaoVendasCidadeState{}
class SuccessCardTotalizacaoVendasCidadeState extends CardTotalizacaoVendasCidadeState{
  final List<Map> estatisticas;

  SuccessCardTotalizacaoVendasCidadeState({required this.estatisticas});
}
class ErrorCardTotalizacaoVendasCidadeState extends CardTotalizacaoVendasCidadeState{
   final String error;

  ErrorCardTotalizacaoVendasCidadeState({required this.error});
}