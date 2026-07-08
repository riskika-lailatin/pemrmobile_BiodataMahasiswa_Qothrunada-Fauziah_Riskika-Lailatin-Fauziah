import 'package:academy/logic/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../../logic/controllers/student_controller.dart';
import '../../ui/widgets/category_chip.dart';
import '../../ui/widgets/custom_bottom_nav.dart';
import '../../ui/widgets/search_bar.dart';
import '../../ui/widgets/student_card.dart';

import 'add_student_page.dart';
import 'directory_page.dart';
import 'profile_page.dart';
import 'student_detail_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final StudentController controller = StudentController();

  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "All Students";

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddStudentPage(),
            ),
          );
        },
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool desktop = constraints.maxWidth > 900;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: desktop ? 50 : 20,
                vertical: 20,
              ),
              child: Column(
                children: [

                  /// HEADER
                  Row(
                    children: [

                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 16),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              "Identity",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// SEARCH BAR
                  SearchStudentBar(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 20),

                  /// CATEGORY
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [

                        CategoryChip(
                          title: "All Students",
                          selected:
                          selectedCategory == "All Students",
                          onTap: () {
                            setState(() {
                              selectedCategory =
                              "All Students";
                            });
                          },
                        ),

                        const SizedBox(width: 10),

                        CategoryChip(
                          title: "Computer Science",
                          selected:
                          selectedCategory ==
                              "Computer Science",
                          onTap: () {
                            setState(() {
                              selectedCategory =
                              "Computer Science";
                            });
                          },
                        ),

                        const SizedBox(width: 10),

                        CategoryChip(
                          title: "Business",
                          selected:
                          selectedCategory == "Business",
                          onTap: () {
                            setState(() {
                              selectedCategory =
                              "Business";
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// LIST STUDENT
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final students = controller.students.where((student) {

                          final keyword = searchController.text.toLowerCase();

                          final matchSearch =
                              student.name.toLowerCase().contains(keyword) ||
                                  student.nim.toLowerCase().contains(keyword);

                          final matchCategory =
                              selectedCategory == "All Students" ||
                                  student.major == selectedCategory;

                          return matchSearch && matchCategory;
                        }).toList();

                        if (students.isEmpty) {
                          return const Center(
                            child: Text(
                              "Student not found",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            final student = students[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: StudentCard(
                                image: student.image,
                                name: student.name,
                                nim: student.nim,
                                major: student.major,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          StudentDetailPage(student: student),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DirectoryPage(),
                ),
              );
              break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddStudentPage(),
                ),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DirectoryPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}