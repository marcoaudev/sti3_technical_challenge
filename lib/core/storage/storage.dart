import 'package:sti3_app/app/models/pedido_model.dart';

abstract interface class IStorage{
  Future<void> startPreferences();
  Future<void> putPedidos({required String key, required List<Pedido> pedidos});
  List<Pedido> getPedidos();
}