import 'package:hive_flutter/hive_flutter.dart';
part 'cliente_model.g.dart';

@HiveType(typeId: 2)
class Cliente extends HiveObject{
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String cnpj;
  @HiveField(3)
  final String cpf;
  @HiveField(4)
  final String nome;
  @HiveField(5)
  final String razaoSocial;
  @HiveField(6)
  final String email;
  @HiveField(7)
  final String dataNascimento;

  Cliente({
    required this.id,
    required this.cnpj,
    required this.cpf,
    required this.nome,
    required this.razaoSocial,
    required this.email,
    required this.dataNascimento,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      cnpj: json['cnpj'],
      cpf: json['cpf'],
      nome: json['nome'],
      razaoSocial: json['razaoSocial'],
      email: json['email'],
      dataNascimento: json['dataNascimento'],
    );
  }
}
