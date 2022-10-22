
import 'package:dictionary/view_models/meaning_list_view_model.dart';
import 'package:dictionary/widgets/mean_list.dart';
import 'package:dictionary/widgets/sign_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeanListView extends StatefulWidget {
  const MeanListView({Key? key}) : super(key: key);

  @override
  State<MeanListView> createState() => _MeanListViewState();
}

class _MeanListViewState extends State<MeanListView> {
  final _controller=TextEditingController();
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

  getWidgetByStatus(MeaningListViewModel vm){
    switch(vm.status.index){
      case 0:
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Opacity(
            opacity:0.1,
              child: Image.asset('assets/images/tdk.png')),
        );
      case 1:
        return Center(
            child: CircularProgressIndicator());
      case 2:
        return const Center(child: Text('No results found.',
        style: TextStyle(fontSize: 18),));
      case 3:
        return MeanList(
            meaningViewModel: vm.meaningViewModel,
            signLanguage:SignLanguage(word: vm.meaningViewModel.word));
    }
  }


}
