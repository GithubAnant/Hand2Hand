import 'package:flutter/material.dart';

class TransactionMeals extends StatelessWidget {
  const TransactionMeals({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic totalMeals = 950;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Donated', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Meals Donated', style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('$totalMeals Meals',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  totalMeals += meal['count'];
                  return Card(
                    color: Colors.green[800],
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(meal['donor'] ?? 'Anonymous',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text(meal['date'] ?? 'Unknown Date', style: TextStyle(color: Colors.white70)),
                      trailing: Text('${meal['count']} Meals',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> meals = [
  {'donor': 'Alice Johnson', 'count': 200, 'date': 'March 20, 2025'},
  {'donor': 'Bob Williams', 'count': 150, 'date': 'March 18, 2025'},
  {'donor': 'Charlie Brown', 'count': 250, 'date': 'March 15, 2025'},
  {'donor': 'David Lee', 'count': 350, 'date': 'March 10, 2025'},
];
