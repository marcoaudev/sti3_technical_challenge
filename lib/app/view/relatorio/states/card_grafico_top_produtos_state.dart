abstract class CardGraficoTopProdutosState {}

class InitialCardGraficoTopProdutosState extends CardGraficoTopProdutosState{}
class LoadingCardGraficoTopProdutosState extends CardGraficoTopProdutosState{}
class SuccessCardGraficoTopProdutosState extends CardGraficoTopProdutosState{
  final List<Map> estatisticas;

  SuccessCardGraficoTopProdutosState({required this.estatisticas});
}
class ErrorCardGraficoTopProdutosState extends CardGraficoTopProdutosState{
   final String error;

  ErrorCardGraficoTopProdutosState({required this.error});
}