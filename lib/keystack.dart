import 'package:flutter/material.dart';

class KeyStack extends StatelessWidget {
  final String arab;
  final String alpha;
  const KeyStack({super.key, required this.arab, required this.alpha});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
            ),
          ),
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              arab,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
            ),
          ),
          child: Center(
            child: Text(
              alpha,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
