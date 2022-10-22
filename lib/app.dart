import 'package:dictionary/view_models/meaning_list_view_model.dart';
import 'package:dictionary/views/mean_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: ChangeNotifierProvider(
        create: (context)=>MeaningListViewModel(),
        child: MeanListView(),
      ),
    );
  }
}
