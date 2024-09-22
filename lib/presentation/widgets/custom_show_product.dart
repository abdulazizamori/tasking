import 'package:flutter/material.dart';

class CustomShowProduct extends StatelessWidget {
  const CustomShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      // color: Colors.blueAccent,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/first.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ships'),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('100 \$'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
