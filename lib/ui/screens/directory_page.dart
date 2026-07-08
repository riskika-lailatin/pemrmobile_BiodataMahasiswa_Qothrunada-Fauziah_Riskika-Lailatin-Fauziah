import 'package:flutter/material.dart';

import '../../logic/controllers/student_controller.dart';
import '../../logic/models/student_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'student_detail_page.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({super.key});

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  final StudentController controller = StudentController();

  final TextEditingController searchController = TextEditingController();

  List<StudentModel> get filteredStudents {
    final keyword = searchController.text.toLowerCase();

    return controller.students.where((student) {
      return student.name.toLowerCase().contains(keyword) ||
          student.major.toLowerCase().contains(keyword) ||
          student.nim.toLowerCase().contains(keyword);
    }).toList();
  }
  Future<void> callPhone(String phone) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'email',
      path: email,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Directory"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),

              decoration: InputDecoration(
                hintText: "Search Directory",
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,

                itemBuilder: (context, index) {
                  final student = filteredStudents[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 18),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                StudentDetailPage(student: student),
                          ),
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.all(18),

                        child: Column(
                          children: [

                            Row(
                              children: [

                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                  AssetImage(student.image),
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        student.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      Text(student.major),

                                      Text(
                                        "NIM : ${student.nim}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Divider(height: 30),

                            Row(
                              children: [

                                Expanded(
                                  child: OutlinedButton.icon(

                                    onPressed: () =>
                                        callPhone(student.phone),

                                    icon: const Icon(Icons.call),

                                    label: const Text("Call"),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: ElevatedButton.icon(

                                    onPressed: () =>
                                        sendEmail(student.email),

                                    icon: const Icon(Icons.email),

                                    label: const Text("Email"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}