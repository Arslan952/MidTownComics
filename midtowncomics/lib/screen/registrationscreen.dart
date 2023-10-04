import 'package:flutter/material.dart';
import 'package:midtowncomics/widget/textformfieldwidget.dart';

import '../widget/header_widget.dart';
import '../widget/sidebar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController r_email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController c_password = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: const Custom_drawer(),
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
                    SizedBox(height: size.height * 0.16),
                     Text(
                      "Join Us At Midtown",
                      style:
                          TextStyle(fontSize:allsize*0.02, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormFieldWidget(
                      title: "Email Address",
                      textEditingController: email,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Reenter Email Address",
                      textEditingController: r_email,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Address Name",
                      textEditingController: address,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "First Name",
                      textEditingController: firstname,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Last Name",
                      textEditingController: lastname,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Date of Birth",
                      textEditingController: dob,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Care of/Company Name(Optional)",
                      textEditingController: companyname,
                      optional: true,
                    ),
                    TextFormFieldWidget(
                      title: "Address 1 (Street address,P.O. Box)",
                      textEditingController: address1,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title:
                          "Address 2 (Apartment suite,unit,building,floor,etc. Optional)",
                      textEditingController: address2,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "City",
                      textEditingController: city,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Zip/Postal Code",
                      textEditingController: zip,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Phone",
                      textEditingController: phone,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Password",
                      textEditingController: password,
                      optional: false,
                    ),
                    TextFormFieldWidget(
                      title: "Reenter Password",
                      textEditingController: c_password,
                      optional: false,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.4,
                          child: Center(
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontWeight: FontWeight.bold,
                                  fontSize: allsize*0.016),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.4,
                          color: const Color(0xff006ccf),
                          child:  Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:allsize*0.016),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Header_Widget(ontap:() => scaffoldKey.currentState!.openDrawer(),)
          ],
        ),
      ),
    );
  }
}
