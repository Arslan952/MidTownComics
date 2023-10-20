import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';
import '../services/apirequest.dart';
import '../widget/header_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checked = false;
  TextEditingController email = TextEditingController(text: "acifjee@gmail.com");
  TextEditingController password = TextEditingController(text:"asdfgh");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child:      Consumer<StreamedDataProvider>(
        builder: (context, provider, child) {
          return   Stack(
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
                      provider.loindata.isEmpty?Container():
                      Text(provider.loindata['DESCRIPTION']=="OK"?"You have Login Successfully.Please wait.....":provider.loindata['DESCRIPTION'],style:
                        TextStyle(color: (provider.loindata['DESCRIPTION']=="OK"?Colors.green:Colors.red),fontSize:allsize*0.015,fontWeight: FontWeight.bold),),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: password,
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
                          const Text("Remember Me")
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      InkWell(
                        onTap: ()async{
                          final streamedDataProvider =
                          Provider.of<StreamedDataProvider>(context, listen: false);
                          Map<String,dynamic>data=await ApiRequests().LoginUser(email.text,password.text, context);
                          // streamedDataProvider.updateData(data);
                        },
                        child: Container(
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.01,),
                      provider.changeindicator==true?const Center(child: CircularProgressIndicator(),):Container()
                    ],
                  ),
                ),
              ),
              Header_Widget(
                ontap: () => scaffoldKey.currentState!.openDrawer(),
              )
            ],
          );
        })
      ),
    );
  }
}
