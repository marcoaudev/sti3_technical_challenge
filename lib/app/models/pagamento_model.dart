import 'package:hive_flutter/hive_flutter.dart';
part 'pagamento_model.g.dart';

@HiveType(typeId: 5)
class Pagamento extends HiveObject{
  @HiveField(1)
  final String id;
  @HiveField(2)
  final int parcela;
  @HiveField(3)
  final double valor;
  @HiveField(4)
  final String codigo;
  @HiveField(5)
  final String nome;

  Pagamento({
    required this.id,
    required this.parcela,
    required this.valor,
    required this.codigo,
    required this.nome,
  });

  factory Pagamento.fromJson(Map<String, dynamic> json) {
    return Pagamento(
      id: json['id'],
      parcela: json['parcela'],
      valor: json['valor'],
      codigo: json['codigo'],
      nome: json['nome'],
    );
  }
}
