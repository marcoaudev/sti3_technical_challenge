import 'package:sti3_app/app/models/pedido_model.dart';

abstract interface class IPedidoRepository{
  Future<void> consultarPedidosPopularDataBase();
  List<Pedido> getPedidos();
}