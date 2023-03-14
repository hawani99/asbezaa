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
  List<Object?> get props => [id, name, image];
  static List<Asbeza> asbezas = [
    Asbeza(
        id: '0',
        name: 'carrot',
        image: Image.asset('images/carrot.jpeg'),
        price: 10),
    Asbeza(
        id: '0',
        name: 'spinach',
        image: Image.asset('images/carrot.jpeg'),
        price: 20),
  ];
}
