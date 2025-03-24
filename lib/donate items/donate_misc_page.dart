import 'package:flutter/material.dart';
import 'package:hand2hand/thankyou_page.dart';

class MiscellaneousDonationPage extends StatefulWidget {
  const MiscellaneousDonationPage({super.key});

  @override
  State<MiscellaneousDonationPage> createState() => _MiscellaneousDonationPageState();
}

class _MiscellaneousDonationPageState extends State<MiscellaneousDonationPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedItem;
  String weight = '';
  String description = '';

  final List<String> donationItems = [
    'Clothes', 'Shoes', 'Slippers', 'Blankets', 'Books', 'Bags', 'Toys',
    'School Supplies', 'Electronics', 'Kitchen Utensils', 'Furniture', 'Medicines',
    'Sports Equipment', 'Bedding', 'Hygiene Products', 'Curtains', 'Winter Wear',
    'Stationery', 'Accessories', 'Miscellaneous'
  ];

  void submitDonation() {

   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ThankyouPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate Items')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: selectedItem,
                hint: Text('Select item to donate'),
                items: donationItems.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                validator: (value) => value == null ? 'Please select an item' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Approximate Weight (e.g. 2 kg, 5 pieces)'),
                onSaved: (value) => weight = value!,
                validator: (value) => value!.isEmpty ? 'Please enter weight/quantity' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Brief Description'),
                onSaved: (value) => description = value!,
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: submitDonation,
                  child: Text('Donate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
