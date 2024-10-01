import 'package:sti3_app/app/models/pedido_model.dart';

abstract class PedidosState {}

class InitialPedidosState extends PedidosState{}
class LoadingPedidosState extends PedidosState{}
class SuccessPedidosState extends PedidosState{
  final List<Pedido> pedidos;

  SuccessPedidosState({required this.pedidos});
}
class ErrorPedidosState extends PedidosState{
   final String error;

  ErrorPedidosState({required this.error});
}