import 'package:flutter/material.dart';
import '../../logic/controllers/student_controller.dart';
import '../../logic/models/student_model.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final StudentController controller = StudentController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String imagePath = '';

  void saveStudent() {
    if (nameController.text.isEmpty ||
        nimController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field wajib diisi")),
      );
      return;
    }

    final newStudent = StudentModel(
      image: imagePath.isEmpty ? 'assets/images/default.png' : imagePath,
      name: nameController.text,
      nim: nimController.text,
      major: 'Unknown',
      semester: '1',
      gender: 'Unknown',
      birthDate: '-',
      email: emailController.text,
      phone: phoneController.text,
      gpa: 0.0,
      address: addressController.text,
    );

    controller.addStudent(newStudent);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Student berhasil ditambahkan")),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Student"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // FOTO
            GestureDetector(
              onTap: () {
                setState(() {
                  imagePath = 'assets/images/default.png';
                });
              },
              child: CircleAvatar(
                radius: 45,
                backgroundImage: imagePath.isEmpty
                    ? null
                    : AssetImage(imagePath),
                child: imagePath.isEmpty
                    ? const Icon(Icons.camera_alt, size: 30)
                    : null,
              ),
            ),

            const SizedBox(height: 20),

            // NAME
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // NIM
            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                labelText: "NIM",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // PHONE
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "No HP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // EMAIL
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // ADDRESS
            TextField(
              controller: addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // SAVE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveStudent,
                child: const Text("Simpan"),
              ),
            )
          ],
        ),
      ),
    );
  }
}