import 'package:hive_flutter/hive_flutter.dart';
part 'produto_model.g.dart';

@HiveType(typeId: 4)
class Produto extends HiveObject{
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String idProduto;
  @HiveField(3)
  final String nome;
  @HiveField(4) 
  final int quantidade;
  @HiveField(5)
  final double valorUnitario;

  Produto({
    required this.id,
    required this.idProduto,
    required this.nome,
    required this.quantidade,
    required this.valorUnitario,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      idProduto: json['idProduto'],
      nome: json['nome'],
      quantidade: json['quantidade'],
      valorUnitario: json['valorUnitario'],
    );
  }
}
