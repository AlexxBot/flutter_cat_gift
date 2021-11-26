import 'dart:typed_data';

import 'package:cat_gift/features/cat/data/datasources/cat_remote_data.dart';
import 'package:cat_gift/features/cat/presentation/bloc/cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatPage extends StatefulWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  _CatPageState createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  //late final CatRemoteData catRemoteData;
  late final CatBloc catBloc;
  late Uint8List _gift;

  @override
  void initState() {
    super.initState();
    catBloc = BlocProvider.of<CatBloc>(context);
    _gift = Uint8List(0);
    _getRandomGift();
  }

  void _getRandomGift() {
    /* catRemoteData.getRandomGift().then((value) => setState(() {
          giftData = value;
        })); */
    catBloc.add(GetRandomGift());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<CatBloc, CatState>(
          bloc: catBloc,
          listener: (context, state) {
            if (state is ErrorState) {
              SnackBar(content: Text(state.message));
            } else if (state is GiftRetrivedState) {
              _gift = state.gift;
            }
          },
          child: BlocBuilder<CatBloc, CatState>(
              bloc: catBloc,
              builder: (context, state) {
                if (state is LoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ErrorState) {
                  return Text('something went wrong');
                } else {
                  return Image.memory(_gift);
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomGift,
        child: Icon(Icons.search),
      ),
    );
  }
}
