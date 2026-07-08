import 'package:flutter/material.dart';
import '../../logic/models/student_model.dart';

class StudentDetailPage extends StatelessWidget {
  final StudentModel student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(student.image),
            ),
            const SizedBox(height: 20),
            Text(student.name),
            Text(student.nim),
            Text(student.email),
            Text(student.phone),
          ],
        ),
      ),
    );
  }
}