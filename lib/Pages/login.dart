import 'package:dog_api_project/Pages/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  String phoneNumber = "7777777777";
  String password = "100100";
  bool phoneNumberValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Phone Number",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 50,
              width: 370,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                // cursorColor: Colors.white,
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                    '[0-9]',
                  ))
                ],

                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: "Phone Number",
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter phone no.',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Text(
                          '+91',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.yellow,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: SizedBox(
              height: 50,
              width: 370,
              child: TextFormField(
                obscureText: _obscureText,
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",

                  // labelText: "Phone Number",
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.zero,
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: _obscureText
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              )),
                  ),
                  prefixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Icon(
                            Icons.password,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.yellow,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (phoneNumber == phoneNumberController.text &&
                    password == passwordController.text) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid Credentials"),
                    ),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                    color: phoneNumberValue ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
