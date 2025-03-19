import 'package:flutter/material.dart';

class HeadingTitleName extends StatelessWidget {
  const HeadingTitleName({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Hello ",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            TextSpan(
              text: '$username!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// this is called in landing_page.dart
