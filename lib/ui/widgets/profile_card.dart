import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String image;
  final String name;
  final String major;
  final String id;

  const ProfileCard({
    super.key,
    required this.image,
    required this.name,
    required this.major,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 210,
        child: Stack(
          children: [
            Container(
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xff08295d),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 40,
              child: CircleAvatar(
                radius: 42,
                backgroundImage: AssetImage(image),
              ),
            ),
            Positioned(
              left: 25,
              top: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    major,
                    style: const TextStyle(fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  Text("ID : $id"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}