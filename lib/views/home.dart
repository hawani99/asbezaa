// ignore_for_file: unused_import

import 'package:asbeza/bloc/asbeza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.blue,
      title: Transform.translate(
        offset: const Offset(-25.0, 0.0),
        child: const Text("ASBEZA"),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.history);
            },
            icon: const Icon(Icons.shopping_bag)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.account_circle_rounded)),
      ],
    );
  }
}
