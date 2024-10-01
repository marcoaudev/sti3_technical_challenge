import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sti3_app/app/models/cliente_model.dart';
import 'package:sti3_app/app/models/endereco_entrega_model.dart';
import 'package:sti3_app/app/models/produto_model.dart';
import 'package:sti3_app/app/models/pagamento_model.dart';
import 'package:sti3_app/app/models/pedido_model.dart';


class HiveConfig {
  static start() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    Hive.initFlutter(dir.path);
    Hive.registerAdapter(PedidoAdapter()); 
    Hive.registerAdapter(ClienteAdapter()); 
    Hive.registerAdapter(ProdutoAdapter()); 
    Hive.registerAdapter(EnderecoEntregaAdapter()); 
    Hive.registerAdapter(PagamentoAdapter()); 
  }
}