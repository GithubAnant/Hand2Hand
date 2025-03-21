import 'package:flutter/material.dart';

class FoodDonationPage extends StatefulWidget {
  const FoodDonationPage({super.key});

  @override
  State<FoodDonationPage> createState() => _FoodDonationPageState();
}

class _FoodDonationPageState extends State<FoodDonationPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedFoodType;
  String quantity = '';
  String description = '';

  final List<String> foodTypes = [
    'Vegetables',
    'Fruits',
    'Grains',
    'Dairy',
    'Cooked Meals',
    'Canned Goods',
  ];

  void submitDonation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Donation submitted: $quantity of $selectedFoodType')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: InputDecoration(labelText: 'Quantity (e.g. 5 kg, 10 packs)'),
                onSaved: (value) => quantity = value!,
                validator: (value) => value!.isEmpty ? 'Please enter quantity' : null,
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
