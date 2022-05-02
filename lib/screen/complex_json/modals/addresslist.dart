import 'package:json_annotation/json_annotation.dart';

part 'adresslist.g.dart';

@JsonSerializable()

class AddressList {
  String location;
AddressList(this.location);

  factory AddressList.fromJson(Map<String, dynamic> data) => _$AddressListFromJson(data);

  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}

