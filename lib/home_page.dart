import 'dart:math';

import 'package:chip_project/chip_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controller = TextEditingController();
  final List<ChipModel> _chipList = [];

  void deleteChip(String id){
    setState(() {
      _chipList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Chip list"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 5,
                children: _chipList.map((chip) => Chip(
                  label: Text(chip.title , style: const TextStyle(color: Colors.white),),
                  onDeleted:(){
                    deleteChip(chip.id);
                  } ,
                  // backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  backgroundColor: Colors.green,
                  deleteIcon: const Icon(Icons.dangerous , color: Colors.red,),
                  shadowColor: Colors.red,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.red , width: 1)
                  ),

                  avatar: Container(
                    width: 12, height: 12,
                    decoration:const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                    ),),


                )).toList()
              ),
            )
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(border: OutlineInputBorder() , hintText: "add here..."),
                  ),
                ),

                const SizedBox(width: 5,),

                ElevatedButton(onPressed: () {
                  setState(() {
                    _chipList.add(ChipModel(id: DateTime.now().toString(), title: controller.text));
                    controller.text = "";
                  });
                }, child: const Text("Add Item"))
              ],
            ),
          ),


        ],
      ),
    );
  }
}
