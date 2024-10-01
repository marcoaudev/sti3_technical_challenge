// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PagamentoAdapter extends TypeAdapter<Pagamento> {
  @override
  final int typeId = 5;

  @override
  Pagamento read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pagamento(
      id: fields[1] as String,
      parcela: fields[2] as int,
      valor: fields[3] as double,
      codigo: fields[4] as String,
      nome: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pagamento obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.parcela)
      ..writeByte(3)
      ..write(obj.valor)
      ..writeByte(4)
      ..write(obj.codigo)
      ..writeByte(5)
      ..write(obj.nome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagamentoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
