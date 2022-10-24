
import 'package:dictionary/view_models/meaning_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/words.dart';
import '../widgets/mean_list.dart';
import '../widgets/status.dart';

class MeanListView extends StatefulWidget {
  const MeanListView({Key? key}) : super(key: key);

  @override
  State<MeanListView> createState() => _MeanListViewState();
}

class _MeanListViewState extends State<MeanListView> {
  final _controller=TextEditingController();
  List<MeansList> list=[];
  Words? words;

  @override
  Widget build(BuildContext context) {
    final vm=Provider.of<MeaningListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/images/tdk.png',
              fit: BoxFit.contain,
              height: 50),
        ),
      ),
      body:SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red[50]
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search..',
                      border: InputBorder.none,
                      contentPadding:const EdgeInsets.all(16),
                      suffixIcon: IconButton(
                        onPressed: (){
                          if(_controller.text.isNotEmpty){
                            vm.getMeanings(_controller.text);
                          }
                        },
                        icon: const Icon(Icons.search),
                      )
                  ),
                ),
              ),
            ),
            getWidgetByStatus(vm)
          ],
        ),
    ),
    );
  }
}
