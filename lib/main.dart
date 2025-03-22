// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hand2hand/landing%20pages/landing_page.dart';
import 'package:hand2hand/landing%20pages/ngo_landing_page.dart';
import 'package:hand2hand/elements/profile.dart';
import 'package:hand2hand/thankyou_page.dart';

void main(){
  runApp(Hand2Hand());
}

class Hand2Hand extends StatelessWidget {
  const Hand2Hand({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}