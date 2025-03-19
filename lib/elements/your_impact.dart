// import 'package:flutter/material.dart';
// import 'package:hand2hand/donate_what.dart';

// class YourImpact extends StatelessWidget {
//   const YourImpact({super.key, required this.heroText, required this.headingText, required this.color});

//   final String heroText;
//   final String headingText;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withAlpha(25),
//               blurRadius: 10,
//               spreadRadius: 15,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 headingText,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),


//             SizedBox(height: MediaQuery.of(context).size.height*0.03),
//             Center(
//               child: Text(
//                 heroText,
//                 style: TextStyle(
//                   fontSize: 26,
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),

//             Center(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DonateWhat()),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: Colors.green,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: Text('View Details'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hand2hand/donate_what.dart';

class YourImpact extends StatelessWidget {
  const YourImpact({
    super.key,
    required this.heroText,
    required this.headingText,
  });

  final String heroText;
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 200, // Adjust height if needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/image_ngo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay for better text visibility
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withAlpha(140),
            ),
          ),

          // Content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    headingText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    heroText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonateWhat()),
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('View Details'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
