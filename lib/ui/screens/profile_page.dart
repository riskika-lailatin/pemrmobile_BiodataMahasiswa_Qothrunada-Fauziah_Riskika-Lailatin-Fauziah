import 'package:flutter/material.dart';
import '../../logic/models/student_model.dart';

class ProfilePage extends StatelessWidget {
  final StudentModel student;

  const ProfilePage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Profile"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // FOTO
            CircleAvatar(
              radius: 50,
              backgroundImage: student.image.isNotEmpty
                  ? AssetImage(student.image)
                  : const AssetImage('assets/images/default.png'),
            ),

            const SizedBox(height: 20),

            // NAME
            Text(
              student.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              student.nim,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // DETAIL CARD
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildRow("Email", student.email),
                    buildRow("Phone", student.phone),
                    buildRow("Major", student.major),
                    buildRow("Semester", student.semester),
                    buildRow("Gender", student.gender),
                    buildRow("Birth Date", student.birthDate),
                    buildRow("GPA", student.gpa.toString()),
                    buildRow("Address", student.address),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(": "),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}