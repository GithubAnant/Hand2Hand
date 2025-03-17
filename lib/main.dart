import 'package:flutter/material.dart';
import 'package:hand2hand/onboarding_screen.dart';

void main(){
  runApp(Hand2Hand());
}

class Hand2Hand extends StatelessWidget {
  const Hand2Hand({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}