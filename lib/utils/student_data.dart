import 'dart:io';

class Global {
  static List<Student> studentInfo = [
    Student(
        name: 'Manav',
        contact: '7096584269',
        course: 'Flutter',
        age: '21',
        grid: '36'),
    Student(
        name: 'Raj',
        contact: '9196584262',
        course: 'UI/UX',
        age: '24',
        grid: '37'),
    Student(
        name: 'Deep',
        contact: '8596384265',
        course: 'Web Development',
        age: '26',
        grid: '38'),
    Student(
        name: 'Neel',
        contact: '9965843690',
        course: 'Designing',
        age: '24',
        grid: '39'),
    Student(
        name: 'Pranav',
        contact: '7896684262',
        course: 'Flutter',
        age: '20',
        grid: '40'),
    Student(
        name: 'Meet',
        contact: '7996584761',
        course: 'Full Stack',
        age: '21',
        grid: '41'),
    Student(
        name: 'Harsh',
        contact: '9996585232',
        course: 'Flutter',
        age: '25',
        grid: '42'),
  ];
  static List<Student> find = [];
}

class Student {
  String name;
  String contact;
  String age;
  String course;
  String grid;
  Student(
      {required this.name,
      required this.contact,
      required this.course,
      required this.age,
      required this.grid});
}
