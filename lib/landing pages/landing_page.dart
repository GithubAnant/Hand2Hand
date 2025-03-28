import 'package:flutter/material.dart';
import 'package:hand2hand/elements/donate_now_card.dart';
import 'package:hand2hand/elements/heading_title.dart';
import 'package:hand2hand/elements/profile_user.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String username = "Anant";

  final List<Map<String, dynamic>> donorsMoney = [
    {
      "name": "Aarav M.",
      "amount": "₹5,000",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Priya S.",
      "amount": "₹3,000",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Rohan K.",
      "amount": "₹2,500",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Ananya V.",
      "amount": "₹2,000",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Vikram T.",
      "amount": "₹1,500",
      "image": "assets/images/card_backdrop.png",
    },
  ];

  final List<Map<String, String>> donorsMeals = [
    {
      "name": "Ishaan R.",
      "amount": "100 meals",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Meera D.",
      "amount": "60 meals",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Vivaan S.",
      "amount": "50 meals",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Aisha K.",
      "amount": "40 meals",
      "image": "assets/images/card_backdrop.png",
    },
    {
      "name": "Rehan P.",
      "amount": "30 meals",
      "image": "assets/images/card_backdrop.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ProfilePage(
                          username: 'Anant',
                          gmailId: 'anant@gmail.com',
                          cityName: 'Islamabad',
                        ),
                  ),
                ); // Calls Profile() when tapped
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_pin, size: 40),
                  SizedBox(width: 8),
                  Text('Your Profile', style: TextStyle(fontSize: 20)),
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

        title: HeadingTitleName(username: username),
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
                    child: DonateNowCard(
                      displayText: 'Change The World With Your Help',
                      displayTextButton: 'Donate Now',
                    ),
                  ),
                ),
                SizedBox(height: 30),

                Text(
                  '🏆 Top Donors',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text('Most Money', style: TextStyle(fontSize: 17)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),

          // Top Donors ListView
          ListViewDonorsTop(donorsWhat: donorsMoney),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text('Most Meals', style: TextStyle(fontSize: 17)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          ListViewDonorsTop(donorsWhat: donorsMeals),
        ],
      ),
    );
  }
}

class ListViewDonorsTop extends StatelessWidget {
  const ListViewDonorsTop({super.key, required this.donorsWhat});

  final List<Map<String, dynamic>> donorsWhat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: donorsWhat.length,
        itemBuilder: (context, index) {
          final donor = donorsWhat[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            margin: EdgeInsets.only(left: 20, right: 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(donor["image"]),
                  radius: 35,
                ),
                SizedBox(height: 8),
                Text(
                  donor["name"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),

                Text(
                  "${donor["amount"]}",
                  style: TextStyle(color: Colors.green, fontSize: 17),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
