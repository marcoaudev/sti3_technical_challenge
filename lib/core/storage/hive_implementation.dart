import 'package:hive_flutter/hive_flutter.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/core/storage/storage.dart';

class HiveImplementation implements IStorage{

  late Box box;
  
  @override
  Future<void> startPreferences() async{
    box = await Hive.openBox('app');
  }

  @override
  Future<void> putPedidos({required String key, required List<Pedido> pedidos}) async {
    await box.put(key, pedidos);
  }
  
  @override
  List<Pedido> getPedidos(){
    return box.get("pedidos");
  }
}