import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Asbeza extends Equatable {
  final String id;
  final String name;
  final Image image;
  final num price;

  const Asbeza(
      {required this.id,
      required this.name,
      required this.image,
      required this.price});
  @override
  factory Asbeza.fromJson(Map<String, dynamic> parsedJson) {
    return Asbeza(
        id: parsedJson["id"],
        name: parsedJson["description"],
        image: parsedJson["image"],
        price: parsedJson["price"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
