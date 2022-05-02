import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

part 'visited.g.dart';

@JsonSerializable(explicitToJson: true)
class Visited {
  String place;

  Visited({required this.place});

  factory Visited.fromJson(Map<String,dynamic> data) => _$VisitedFromJson(data);

  Map<String,dynamic> toJson() => _$VisitedToJson(this);

}
