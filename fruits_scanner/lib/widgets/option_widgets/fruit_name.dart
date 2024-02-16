import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitName extends StatefulWidget {
  const FruitName({super.key});

  @override
  State<FruitName> createState() => _FruitNameState();
}

class _FruitNameState extends State<FruitName> {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 22,
      left: 90,
      child: Text(
        "Strawberry",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
