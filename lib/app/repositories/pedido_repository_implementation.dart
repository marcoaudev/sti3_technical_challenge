import 'package:sti3_app/app/repositories/pedido_repository.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/core/errors/exceptions.dart';
import 'package:sti3_app/core/http/http_client_interface.dart';
import 'package:sti3_app/core/storage/storage.dart';

class PedidoRepositoryImplementation implements IPedidoRepository {
  final IHttpClient client;
  final IStorage storage;

  PedidoRepositoryImplementation({
    required this.client,
    required this.storage,
  });

  @override
  Future<void> consultarPedidosPopularDataBase() async {
    final response = await client.get("https://desafiotecnicosti3.azurewebsites.net/pedido");
    if(response.statusCode == 200) {
      List pedidos = response.data;
      await storage.startPreferences();
      storage.putPedidos(
        key: "pedidos",
        pedidos: pedidos.map((pedido) => Pedido.fromJson(pedido)).toList(),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  List<Pedido> getPedidos() {
    storage.startPreferences();
    List<Pedido> pedidos = storage.getPedidos();
    return pedidos;
  }
}
