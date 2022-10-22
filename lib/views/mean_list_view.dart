import 'package:flutter/material.dart';

class MeanListView extends StatefulWidget {
  const MeanListView({Key? key}) : super(key: key);

  @override
  State<MeanListView> createState() => _MeanListViewState();
}

class _MeanListViewState extends State<MeanListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/tdk.png',
            fit: BoxFit.contain,
            height: 50),
      ),
    );
  }
}
