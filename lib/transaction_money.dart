import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  Text('Total Funds Received', style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('₹${transactions.isNotEmpty ? transactions.map((t) => int.tryParse(t['amount'] ?? '0') ?? 0).reduce((a, b) => a + b) : 0}',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: transactions.isNotEmpty
                  ? ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        return Card(
                          color: Colors.green[800],
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(transaction['donor'] ?? 'Unknown Donor',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            subtitle: Text(transaction['date'] ?? 'Unknown Date', style: TextStyle(color: Colors.white70)),
                            trailing: Text('₹${transaction['amount'] ?? '0'}',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No transactions yet',
                          style: TextStyle(color: Colors.white70, fontSize: 16)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> transactions = [
  {'donor': 'John Doe', 'amount': '5000', 'date': 'March 20, 2025'},
  {'donor': 'Anonymous', 'amount': '12000', 'date': 'March 18, 2025'},
  {'donor': 'Emma Watson', 'amount': '8000', 'date': 'March 15, 2025'},
  {'donor': 'Anonymous', 'amount': '10000', 'date': 'March 15, 2025'},
  {'donor': 'Anonymous', 'amount': '7000', 'date': 'March 15, 2025'},
  {'donor': 'David Warner', 'amount': '20000', 'date': 'March 15, 2025'},
  {'donor': 'Michael Smith', 'amount': '3000', 'date': 'March 10, 2025'},
];