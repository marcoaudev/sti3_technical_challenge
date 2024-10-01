// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PedidoAdapter extends TypeAdapter<Pedido> {
  @override
  final int typeId = 1;

  @override
  Pedido read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pedido(
      id: fields[1] as String,
      numero: fields[2] as int,
      dataCriacao: fields[3] as DateTime,
      dataAlteracao: fields[4] as DateTime,
      status: fields[5] as String,
      desconto: fields[6] as double,
      frete: fields[7] as double,
      subTotal: fields[8] as double,
      valorTotal: fields[9] as double,
      cliente: fields[10] as Cliente,
      enderecoEntrega: fields[11] as EnderecoEntrega,
      produtos: (fields[12] as List).cast<Produto>(),
      pagamentos: (fields[13] as List).cast<Pagamento>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pedido obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.numero)
      ..writeByte(3)
      ..write(obj.dataCriacao)
      ..writeByte(4)
      ..write(obj.dataAlteracao)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.desconto)
      ..writeByte(7)
      ..write(obj.frete)
      ..writeByte(8)
      ..write(obj.subTotal)
      ..writeByte(9)
      ..write(obj.valorTotal)
      ..writeByte(10)
      ..write(obj.cliente)
      ..writeByte(11)
      ..write(obj.enderecoEntrega)
      ..writeByte(12)
      ..write(obj.produtos)
      ..writeByte(13)
      ..write(obj.pagamentos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PedidoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
