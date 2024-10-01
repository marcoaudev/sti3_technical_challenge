import 'package:hive_flutter/hive_flutter.dart';
import 'package:sti3_app/app/models/cliente_model.dart';
import 'package:sti3_app/app/models/endereco_entrega_model.dart';
import 'package:sti3_app/app/models/produto_model.dart';
import 'package:sti3_app/app/models/pagamento_model.dart';
part 'pedido_model.g.dart';

@HiveType(typeId: 1)
class Pedido extends HiveObject{
  @HiveField(1)
  final String id;
  @HiveField(2)
  final int numero;
  @HiveField(3)
  final DateTime dataCriacao;
  @HiveField(4)
  final DateTime dataAlteracao;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final double desconto;
  @HiveField(7)
  final double frete;
  @HiveField(8)
  final double subTotal;
  @HiveField(9)
  final double valorTotal;
  @HiveField(10)
  final Cliente cliente;
  @HiveField(11)
  final EnderecoEntrega enderecoEntrega;
  @HiveField(12)
  final List<Produto> produtos;
  @HiveField(13)
  final List<Pagamento> pagamentos;

  Pedido({
    required this.id,
    required this.numero,
    required this.dataCriacao,
    required this.dataAlteracao,
    required this.status,
    required this.desconto,
    required this.frete,
    required this.subTotal,
    required this.valorTotal,
    required this.cliente,
    required this.enderecoEntrega,
    required this.produtos,
    required this.pagamentos,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      numero: json['numero'],
      dataCriacao: DateTime.parse(json['dataCriacao']),
      dataAlteracao: DateTime.parse(json['dataAlteracao']),
      status: json['status'],
      desconto: double.parse(json['desconto'].toString()),
      frete: double.parse(json['frete'].toString()),
      subTotal: double.parse(json['subTotal'].toString()),
      valorTotal: double.parse(json['valorTotal'].toString()),
      cliente: Cliente.fromJson(json['cliente']),
      enderecoEntrega: EnderecoEntrega.fromJson(json['enderecoEntrega']),
      produtos: (json['itens'] as List<dynamic>).map((item) => Produto(
        id: item['id'],
        idProduto: item['idProduto'],
        nome: item['nome'],
        quantidade: item['quantidade'],
        valorUnitario: double.parse(item['valorUnitario'].toString()),
      )).toList(),
      pagamentos: (json['pagamento'] as List<dynamic>).map((pagamento) => Pagamento(
        id: pagamento['id'],
        parcela: pagamento['parcela'],
        valor: double.parse(pagamento['valor'].toString()),
        codigo: pagamento['codigo'],
        nome: pagamento['nome'],
      )).toList(),
    );
  }
}
