

import 'package:flutter/material.dart';
import 'package:hand2hand/thankyou_page.dart';

class FoodDonationPage extends StatefulWidget {
  const FoodDonationPage({super.key});

  @override
  State<FoodDonationPage> createState() => _FoodDonationPageState();
}

class _FoodDonationPageState extends State<FoodDonationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedFoodType;

  final List<String> foodTypes = [
    'Vegetables',
    'Fruits',
    'Grains',
    'Dairy',
    'Cooked Meals',
    'Canned Goods'
    'Others',
  ];


void submitDonation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ThankyouPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        appBar: AppBar(title: Text('Donate Food')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedFoodType,
                  hint: Text('Select food type'),
                  items: foodTypes.map((food) {
                    return DropdownMenuItem(value: food, child: Text(food));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFoodType = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a food type' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: quantityController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Quantity (e.g. 5 kg, 10 packs)'),
                  validator: (value) => value!.isEmpty ? 'Please enter quantity' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Brief Description (optional)'),
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
      ),
    );
  }
}
