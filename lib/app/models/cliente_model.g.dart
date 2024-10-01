// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClienteAdapter extends TypeAdapter<Cliente> {
  @override
  final int typeId = 2;

  @override
  Cliente read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cliente(
      id: fields[1] as String,
      cnpj: fields[2] as String,
      cpf: fields[3] as String,
      nome: fields[4] as String,
      razaoSocial: fields[5] as String,
      email: fields[6] as String,
      dataNascimento: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.cnpj)
      ..writeByte(3)
      ..write(obj.cpf)
      ..writeByte(4)
      ..write(obj.nome)
      ..writeByte(5)
      ..write(obj.razaoSocial)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.dataNascimento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClienteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
