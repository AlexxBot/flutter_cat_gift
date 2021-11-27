import 'dart:typed_data';

import 'package:cat_gift/core/widgets/button_widget.dart';
import 'package:cat_gift/core/widgets/snack_widget.dart';
import 'package:cat_gift/features/cat/data/datasources/cat_remote_data.dart';
import 'package:cat_gift/features/cat/presentation/bloc/cat_bloc.dart';
import 'package:cat_gift/features/cat/presentation/widgets/cat_gift_widget.dart';
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
  //Uint8List? _gift;

  @override
  void initState() {
    super.initState();
    catBloc = BlocProvider.of<CatBloc>(context);
    _getRandomGift();
  }

  void _getRandomGift() {
    catBloc.add(GetRandomGift());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocListener<CatBloc, CatState>(
                  bloc: catBloc,
                  listener: (context, state) {
                    if (state is ErrorState) {
                      SnackWidget.showMessage(context, state.message,
                          isError: true);
                    }
                  },
                  child: BlocBuilder<CatBloc, CatState>(
                      bloc: catBloc,
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const CircularProgressIndicator();
                        } else if (state is GiftRetrivedState) {
                          return CatGiftWidget(gift: state.gift);
                        } else {
                          return const Text(
                              'no gift provided!, press meow button');
                        }
                      }),
                ),
              ),
            ),
            BlocBuilder<CatBloc, CatState>(
                bloc: catBloc,
                builder: (context, state) {
                  return ButtonWidget(
                    enabled: (state is LoadingState) ? false : true,
                    onPressed: _getRandomGift,
                    title: "Meow",
                  );
                }),
          ],
        ),
      ),
    );
  }
}
