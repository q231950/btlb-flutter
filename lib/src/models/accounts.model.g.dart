// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountsModelAdapter extends TypeAdapter<AccountsModel> {
  @override
  final int typeId = 1;

  @override
  AccountsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountsModel()..accounts = (fields[0] as List)?.cast<Account>();
  }

  @override
  void write(BinaryWriter writer, AccountsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.accounts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
