import 'package:flutter/material.dart';

import '../widget/header_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checked = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.16,
                    ),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checked,
                          onChanged: (newValue) {
                            setState(() {
                              checked = newValue!;
                            });
                          },
                        ),
                        Text("Remember Me")
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.07,
                      color: const Color(0xff006ccf),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "Login with your Social Account",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 4)),
                      child: Row(
                        children: [
                          Image.asset("assets/images/google.png"),
                          SizedBox(
                            width: size.width * 0.23,
                          ),
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Header_Widget(
              ontap: () => scaffoldKey.currentState!.openDrawer(),
            )
          ],
        ),
      ),
    );
  }
}
