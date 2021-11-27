import 'dart:typed_data';

import 'package:cat_gift/core/global.dart/size_constants.dart';
import 'package:flutter/material.dart';

class CatGiftWidget extends StatelessWidget {
  final Uint8List gift;
  const CatGiftWidget({Key? key, required this.gift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        /* padding:
            const EdgeInsets.symmetric(vertical: vspace, horizontal: hspace), */
        decoration: const BoxDecoration(
          //borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          /* image: DecorationImage(
                image: MemoryImage(gift), fit: BoxFit.fitWidth) */
        ),
        child: Image.memory(
          gift,
        ));
  }
}
