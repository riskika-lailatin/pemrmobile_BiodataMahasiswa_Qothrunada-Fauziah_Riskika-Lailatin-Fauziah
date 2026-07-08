import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String image;
  final String name;
  final String nim;
  final String major;
  final VoidCallback onTap;

  const StudentCard({
    super.key,
    required this.image,
    required this.name,
    required this.nim,
    required this.major,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "NIM : $nim",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Chip(label: Text(major)),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 32,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}