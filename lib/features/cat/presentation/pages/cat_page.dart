import 'dart:typed_data';

import 'package:cat_gift/features/cat/data/datasources/cat_remote_data.dart';
import 'package:flutter/material.dart';

class CatPage extends StatefulWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  _CatPageState createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  late final CatRemoteData catRemoteData;
  late Uint8List? giftData = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catRemoteData = CatRemoteData();
    //_getRandomGift();
  }

  void _getRandomGift() {
    catRemoteData.getRandomGift().then((value) => setState(() {
          giftData = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            giftData != null ? Image.memory(giftData!) : const Text("No data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomGift,
      ),
    );
  }
}
