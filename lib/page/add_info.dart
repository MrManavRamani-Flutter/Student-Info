// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_info/utils/student_data.dart';

class Add_Info extends StatefulWidget {
  const Add_Info({super.key});

  @override
  State<Add_Info> createState() => _Add_InfoState();
}

class _Add_InfoState extends State<Add_Info> {
  TextEditingController gridController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  int selectedIndex = -1;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  File? file;

  @override
  Widget build(BuildContext context) {
    // File picImg = '' as File;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Info Student'),
        centerTitle: true,
      ),
      body: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(25),
            width: double.infinity,
            // color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // GRID
                  TextField(
                    controller: gridController,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    decoration: const InputDecoration(
                      hintText: 'GRID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Name
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Contact Number
                  TextField(
                    controller: contactController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Contact Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Age
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Course Name
                  TextField(
                    controller: courseController,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: const InputDecoration(
                      hintText: 'Course Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            //
                            String name = nameController.text.trim();
                            String contact = contactController.text.trim();
                            String course = courseController.text.trim();
                            String age = ageController.text.trim();
                            String grid = gridController.text.trim();

                            if (name.isNotEmpty &&
                                contact.isNotEmpty &&
                                age.isNotEmpty &&
                                course.isNotEmpty &&
                                grid.isNotEmpty) {
                              setState(() {
                                nameController.text = '';
                                contactController.text = '';
                                ageController.text = '';
                                gridController.text = '';
                                courseController.text = '';

                                Global.studentInfo.add(
                                  Student(
                                    name: name,
                                    contact: contact,
                                    course: course,
                                    age: age,
                                    grid: grid,
                                  ),
                                );
                                // contacts.add(Contact(name: name, contact: contact));
                              });
                            }
                            Navigator.of(context).pushNamed('view_info');
                          },
                          child: const Text('Save')),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
