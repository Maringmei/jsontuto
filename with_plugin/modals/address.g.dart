// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      temp: json['temp'] as String,
      visit: (json['visit'] as List<dynamic>)
          .map((e) => Visited.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'temp': instance.temp,
      'visit': instance.visit,
    };
