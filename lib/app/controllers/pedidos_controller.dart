import 'package:flutter/foundation.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/app/repositories/pedido_repository.dart';
import 'package:sti3_app/app/view/pedido/states/pedidos_page_state.dart';

class PedidosController extends ValueNotifier<PedidosState>{
  final IPedidoRepository repository;
  PedidosController(this.repository) : super(InitialPedidosState());

  List<Pedido> pedidos = [];

  Future<void> consultarPedidos() async{
    value = LoadingPedidosState();
    try{
      await repository.consultarPedidosPopularDataBase();
      pedidos = repository.getPedidos(); //busca os pedidos direto do BD do Hive
      value = SuccessPedidosState(pedidos: pedidos);
    }catch(e){
      //Poderia exibir o erro capturado, mas isso iria expor falhas, por isso mostro essa mensagem padrão.
      value = ErrorPedidosState(error: "Houve um problema para buscar os pedidos, verifique sua internet e tente novamente");
    }
  }

  Future<void> searchPedidosFromName({required String nome}) async{
    value = LoadingPedidosState();
    try{
      if(nome.isNotEmpty){
        pedidos = repository.getPedidos();
        pedidos = pedidos.where((pedido) => pedido.cliente.nome.toLowerCase().contains(nome.toLowerCase())).toList();
      }else{
        pedidos = repository.getPedidos();
      }
      value = SuccessPedidosState(pedidos: pedidos);
    }catch(e){
      value = ErrorPedidosState(error: "Houve um problema ao buscar os pedidos, tente novamente.");
    }
  }
}