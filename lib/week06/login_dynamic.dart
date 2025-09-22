import 'package:flutter/material.dart';

class LoginDynamic extends StatefulWidget {
  const LoginDynamic({super.key});

  @override
  State<LoginDynamic> createState() => _LoginDynamicState();
}

class _LoginDynamicState extends State<LoginDynamic> {
  @override
  Widget build(BuildContext context) {
    List<Color> darkBgColors = [
      const Color(0xFF0D1441),
      const Color(0xFF283584),
      const Color(0xFF376AB2),
    ];

    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
    ];

    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: now.hour < 10 ? lightBgColors : darkBgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        now.hour < 10 ? "Good Morning" : "Good Evening",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "Please sign in below",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextField(),
                      Text(
                        "password",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextField(),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Image.asset(
                  'assets1/images/landscape.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
