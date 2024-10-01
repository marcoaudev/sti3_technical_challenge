// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_entrega_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnderecoEntregaAdapter extends TypeAdapter<EnderecoEntrega> {
  @override
  final int typeId = 3;

  @override
  EnderecoEntrega read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnderecoEntrega(
      id: fields[1] as String,
      endereco: fields[2] as String,
      numero: fields[3] as String,
      cep: fields[4] as String,
      bairro: fields[5] as String,
      cidade: fields[6] as String,
      estado: fields[7] as String,
      complemento: fields[8] as String,
      referencia: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EnderecoEntrega obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.endereco)
      ..writeByte(3)
      ..write(obj.numero)
      ..writeByte(4)
      ..write(obj.cep)
      ..writeByte(5)
      ..write(obj.bairro)
      ..writeByte(6)
      ..write(obj.cidade)
      ..writeByte(7)
      ..write(obj.estado)
      ..writeByte(8)
      ..write(obj.complemento)
      ..writeByte(9)
      ..write(obj.referencia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnderecoEntregaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
