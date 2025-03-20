import 'package:flutter/material.dart';
import 'package:hand2hand/elements/your_impact.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.cityName, required this.username, required this.gmailId});

  final String cityName;
  final String username;
  final String gmailId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          // Profile Picture
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/profile.jpg",
              ), // Change to network image if needed
            ),
          ),

          SizedBox(height: 10),

          // Name & Email
          Text(
            widget.username.trimRight().trimLeft(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(widget.gmailId.trimRight().trimLeft(), style: TextStyle(color: Colors.grey)),
          Text(widget.cityName.trimRight().trimLeft(), style: TextStyle(color: Colors.grey)),

          SizedBox(height: 20),

          YourImpact(heroText: '90 Meals', headingText: 'Meals Donated'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          YourImpact(heroText: '₹6500', headingText: 'Funds Donated'),

          // Options List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 20),
                ProfileOption(
                  icon: Icons.lock,
                  title: "Privacy Settings",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: Icons.help,
                  title: "Help & Support",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Profile Option Widget
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
