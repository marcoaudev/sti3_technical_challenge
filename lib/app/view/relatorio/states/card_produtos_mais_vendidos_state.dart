abstract class CardProdutosMaisVendidosState {}

class InitialCardProdutosMaisVendidosState extends CardProdutosMaisVendidosState{}
class LoadingCardProdutosMaisVendidosState extends CardProdutosMaisVendidosState{}
class SuccessCardProdutosMaisVendidosState extends CardProdutosMaisVendidosState{
  final List<Map> estatisticas;

  SuccessCardProdutosMaisVendidosState({required this.estatisticas});
}
class ErrorCardProdutosMaisVendidosState extends CardProdutosMaisVendidosState{
   final String error;

  ErrorCardProdutosMaisVendidosState({required this.error});
}