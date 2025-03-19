import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/image1.png",
      "title": 'Spread Love Easier',
      "desc":
          'If you want to help, but don\'t know how to, now you can do it through Hand2Hand',
    },
    {
      "image": "assets/images/image2.png",
      "title": "Trusted NGO's",
      "desc": "Only verified organization on this platform",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Start to help",
      "desc": "Let's dive in and help the needy!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 76, 89),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            138,
                            0,
                            0,
                            0,
                          ), // Shadow color
                          blurRadius: 10, // Softness of the shadow
                          spreadRadius: 2, // How much shadow spreads
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    onboardingData[index]['title']!,
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color.fromARGB(255, 255, 235, 235),
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.18,
                      vertical: 4,
                    ),
                    child: Text(
                      onboardingData[index]['desc']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 173, 172, 172),
                        fontFamily: 'lato',
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 8,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: () {
                if (_currentPage == onboardingData.length - 1) {
                  // Navigate to Home Screen
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(
                _currentPage == onboardingData.length - 1 ? "Finish" : "Next",
                style: TextStyle(
                  color: Colors.white,
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// i have not used this anywhere yet