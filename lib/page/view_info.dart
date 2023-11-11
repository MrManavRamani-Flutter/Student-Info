// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:student_info/utils/student_data.dart';

class View_Info extends StatefulWidget {
  const View_Info({super.key});

  @override
  State<View_Info> createState() => _View_InfoState();
}

class _View_InfoState extends State<View_Info> {
  @override
  Widget build(BuildContext context) {
    String nameTxt = '';
    String ageTxt = '';
    String contactTxt = '';
    String courseTxt = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Student Info'),
        centerTitle: true,
      ),
      body: (Global.studentInfo.isNotEmpty)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ...Global.studentInfo.map((e) {
                    return Container(
                      color: Colors.blue,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              e.grid,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  Text(
                                    e.course,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => SimpleDialog(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          'Student Info',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            // Name
                                            TextField(
                                              keyboardType: TextInputType.text,
                                              decoration: const InputDecoration(
                                                  hintText: 'Enter Name'),
                                              onChanged: (value) {
                                                setState(() {
                                                  nameTxt = value;
                                                });
                                              },
                                            ),
                                            // Age
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  hintText: 'Enter Age'),
                                              onChanged: (value) {
                                                setState(() {
                                                  ageTxt = value;
                                                });
                                              },
                                            ),
                                            // Contact
                                            TextField(
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                  hintText: 'Enter Contact'),
                                              onChanged: (value) {
                                                setState(() {
                                                  contactTxt = value;
                                                });
                                              },
                                            ),
                                            // Course
                                            TextField(
                                              keyboardType: TextInputType.text,
                                              decoration: const InputDecoration(
                                                  hintText: 'Enter Course'),
                                              onChanged: (value) {
                                                setState(() {
                                                  courseTxt = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (nameTxt.isNotEmpty &&
                                                  ageTxt.isNotEmpty &&
                                                  contactTxt.isNotEmpty &&
                                                  courseTxt.isNotEmpty) {
                                                e.name = nameTxt;
                                                e.age = ageTxt;
                                                e.contact = contactTxt;
                                                e.course = courseTxt;
                                                Navigator.pop(context);
                                              }
                                            });
                                          },
                                          child: const Text('Update'))
                                    ],
                                  ),
                                );
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () {
                                Global.studentInfo.remove(e);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: 700,
              width: double.infinity,
              child: const Text(
                'No Information..',
              ),
            ),
    );
  }
}
