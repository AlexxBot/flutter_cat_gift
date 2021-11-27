import 'dart:typed_data';

import 'package:flutter/material.dart';

class CatGiftWidget extends StatelessWidget {
  final Uint8List gift;
  const CatGiftWidget({Key? key, required this.gift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.memory(gift));
  }
}
