import 'package:dog_api_project/Pages/login.dart';
import 'package:dog_api_project/Pages/navigation_page.dart';
import 'package:flutter/material.dart';

class LogInSignUp extends StatefulWidget {
  const LogInSignUp({super.key});

  @override
  State<LogInSignUp> createState() => _LogInState();
}

class _LogInState extends State<LogInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 270.0),
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: const Icon(
                  Icons.pets_sharp,
                  size: 60,
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Millions of Pets.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
          const Text(
            "Forever Best..",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const NavigationPage())
              //         );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              height: 45,
              width: 340,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 218, 182, 72),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                "Sign up for Free",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 19),
              height: 45,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(
                      "lib/assets/images/google.jpeg",
                      height: 22,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogIn()));
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationPage()));
              },
              child: const Text(
                "Continue as guest",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
