import 'package:flutter/material.dart';

class DonateWhat extends StatefulWidget {
  const DonateWhat({super.key});

  @override
  State<DonateWhat> createState() => _DonateWhatState();
}

class _DonateWhatState extends State<DonateWhat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appbar
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
      ),

      // donate what
      body: Center(
        child: Column(
          children: [
            Card()
          ],
        ),
      ),
    );
  }
}