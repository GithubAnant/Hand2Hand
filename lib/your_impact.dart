import 'package:flutter/material.dart';
import 'package:hand2hand/donate_what.dart';

class YourImpact extends StatelessWidget {
  const YourImpact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🌍 Your Impact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                '20 meals donated',
                style: TextStyle(
                  fontSize: 26,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Center(
              child: Text(
                '₹13000 donated',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 15),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonateWhat()),
                  );
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text('Donate Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



