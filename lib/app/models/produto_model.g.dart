// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProdutoAdapter extends TypeAdapter<Produto> {
  @override
  final int typeId = 4;

  @override
  Produto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Produto(
      id: fields[1] as String,
      idProduto: fields[2] as String,
      nome: fields[3] as String,
      quantidade: fields[4] as int,
      valorUnitario: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Produto obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.idProduto)
      ..writeByte(3)
      ..write(obj.nome)
      ..writeByte(4)
      ..write(obj.quantidade)
      ..writeByte(5)
      ..write(obj.valorUnitario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdutoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
