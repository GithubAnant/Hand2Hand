import 'package:flutter/material.dart';
import 'package:hand2hand/elements/donate_now_card.dart';
import 'package:hand2hand/elements/heading_title.dart';
import 'package:hand2hand/elements/your_impact.dart';
import 'package:hand2hand/profile.dart';

class NgoLandingPage extends StatefulWidget {
  const NgoLandingPage({super.key});

  @override
  State<NgoLandingPage> createState() => _NgoLandingPageState();
}

class _NgoLandingPageState extends State<NgoLandingPage> {
  String ngoname = "Bridge Project";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())); // Calls Profile() when tapped
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_pin, size: 40,),
                  SizedBox(width: 8), 
                  Text('Your Profile', style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu), // Add an icon (menu or any other)
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),

        title: HeadingTitleName(username: ngoname),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          // Top Donors Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.45,
                    child: DonateNowCard(displayText: 'Your Helping Hands Make A Difference', displayTextButton: 'Explore Donations',),
                  ),
                ),
                SizedBox(height: 30),

                Text(
                  '🌍 Your Impact',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          // Text('Meals Provided', style: TextStyle(fontSize: 20)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          YourImpact(heroText: '950 Meals Donated', headingText: 'Meals Provided',),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          YourImpact(heroText: '₹65000 Secured', headingText: 'Funds Raised',)
        ],
      ),
    );
  }
}
