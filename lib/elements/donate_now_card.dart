import 'package:flutter/material.dart';
import 'package:hand2hand/donate_what.dart';

class DonateNowCard extends StatelessWidget {
  const DonateNowCard({
    super.key, required this.displayText, required this.displayTextButton,
  });

  final String displayText;
  final String displayTextButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        
      
      
        children: [
          
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/card_backdrop.png',
                fit: BoxFit.fill, 
              ),
            ),
          ),
          
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 38,
                  right: 38,
                  top: 20,
                  bottom: 5,
                ),
                child: Text(
                  displayText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DonateWhat()));
                },
              
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text(displayTextButton),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// this is called in landing_page.dart 
