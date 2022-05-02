import 'package:json_annotation/json_annotation.dart';
import 'package:jsontuto/Screen/with_plugin/modals/visited.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String temp;
  List<Visited> visit;

  Address({required this.temp,required this.visit});

  factory Address.fromJson(Map<String,dynamic> data) => _$AddressFromJson(data);

  Map<String,dynamic> toJson() => _$AddressToJson(this);

}