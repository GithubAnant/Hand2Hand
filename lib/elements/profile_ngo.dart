import 'package:flutter/material.dart';

class NGOProfilePage extends StatelessWidget {
  const NGOProfilePage({super.key});
  final String ngoName = "Helping Hands";
  final String city = "New Delhi";
  final String email = "contact@helpinghands.org";
  final String phone = "+91 9876543210";
  final int totalVolunteers = 120;
  final String registrationNumber = "NGO123456";
  final String yearFounded = "2010";
  final String officeAddress = "123 Charity Road, New Delhi, India";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGO Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/ngo_logo.png'), // Change this to network if needed
            ),
            SizedBox(height: 16),
            Text(ngoName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(city, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            Divider(height: 32, thickness: 1),
            _buildInfoTile(Icons.email, "Email", email),
            _buildInfoTile(Icons.phone, "Phone", phone),
            _buildInfoTile(Icons.people, "Total Volunteers", "$totalVolunteers"),
            _buildInfoTile(Icons.confirmation_number, "Registration Number", registrationNumber),
            _buildInfoTile(Icons.calendar_today, "Year Founded", yearFounded),
            _buildInfoTile(Icons.location_on, "Office Address", officeAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[700]),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
