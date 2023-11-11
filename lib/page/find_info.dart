// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:student_info/utils/student_data.dart';

class Find_Data extends StatefulWidget {
  const Find_Data({super.key});

  @override
  State<Find_Data> createState() => _Find_DataState();
}

class _Find_DataState extends State<Find_Data> {
  TextEditingController gridCon = TextEditingController();
  @override
  void initState() {
    Global.find = Global.studentInfo;
    super.initState();
  }

  void filterData(String val) {
    List<Student> res = [];
    if (val.isEmpty) {
      res = Global.studentInfo;
    } else {
      res = Global.studentInfo.where((e) => e.grid.contains(val)).toList();
    }
    setState(() {
      Global.find = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Find Student Info'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (val) => filterData(val),
                // onChanged: (value) => filterData(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: Global.find.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(Global.find[index].grid),
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        Global.find[index].grid.toString(),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      title: Text(
                        Global.find[index].name.toString(),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      subtitle: Text(
                        Global.find[index].course.toString(),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        // Column(
        //   children: [
        //     TextField(
        //       controller: gridCon,
        //       decoration: InputDecoration(hintText: 'GRID Enter'),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         String grid = gridCon.text.trim();
        //         // print(grid);
        //
        //         Global.studentInfo.map((e) {
        //           if (e.grid == grid) {
        //             Global.find.addAll(e as List<Map<String, dynamic>>);
        //           } else {
        //             return null;
        //           }
        //         });
        //         print(Global.find.length);
        //         setState(() {});
        //       },
        //       child: Text('Find'),
        //     ),
        //   ],
        // ),
        );
  }
}
