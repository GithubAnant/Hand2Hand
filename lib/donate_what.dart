import 'package:flutter/material.dart';
import 'package:hand2hand/donate%20items/donate_food_page.dart';
import 'package:hand2hand/donate%20items/donate_misc_page.dart';
import 'package:hand2hand/donate%20items/donate_money_page.dart';

class DonateWhat extends StatefulWidget {
  const DonateWhat({super.key});

  @override
  State<DonateWhat> createState() => _DonateWhatState();
}

class _DonateWhatState extends State<DonateWhat> {
  final List<Map<String, dynamic>> options = [
    {"name": "Money", "image": "assets/images/image.jpg", "nameOfWidget": DonateMoneyPage()},
    {"name": "Food", "image": "assets/images/image1.png", "nameOfWidget": FoodDonationPage()},
    {"name": "Miscellaneous", "image": "assets/images/image2.png", "nameOfWidget": MiscellaneousDonationPage()},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text("Donate What?", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 118, 233, 122),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Choose what to donate:',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => options[index]['nameOfWidget']),
                          );
                        
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(79, 145, 165, 142),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.asset(options[index]['image'], fit: BoxFit.cover, height: MediaQuery.of(context).size.height * 0.3),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Text(
                                    options[index]['name']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => options[index]['nameOfWidget']),
                                        );
                                      
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                    ),
                                    child: Text("Select"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
