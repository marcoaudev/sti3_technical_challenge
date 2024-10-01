import 'package:hive_flutter/hive_flutter.dart';
part 'endereco_entrega_model.g.dart';

@HiveType(typeId: 3)
class EnderecoEntrega extends HiveObject{
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String endereco;
  @HiveField(3)
  final String numero;
  @HiveField(4)
  final String cep;
  @HiveField(5)
  final String bairro;
  @HiveField(6)
  final String cidade;
  @HiveField(7)
  final String estado;
  @HiveField(8)
  final String complemento;
  @HiveField(9)
  final String referencia;

  EnderecoEntrega({
    required this.id,
    required this.endereco,
    required this.numero,
    required this.cep,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.complemento,
    required this.referencia,
  });

  factory EnderecoEntrega.fromJson(Map<String, dynamic> json) {
    return EnderecoEntrega(
      id: json['id'],
      endereco: json['endereco'],
      numero: json['numero'],
      cep: json['cep'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      estado: json['estado'],
      complemento: json['complemento'],
      referencia: json['referencia'],
    );
  }
}
