import 'package:flutter/material.dart';
import 'package:midtowncomics/widget/myprofilewidget.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyAccountSetting extends StatefulWidget {
  const MyAccountSetting({super.key});

  @override
  State<MyAccountSetting> createState() => _MyAccountSettingState();
}

class _MyAccountSettingState extends State<MyAccountSetting> {
  bool active = true;
  bool inactive = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: const Custom_drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.165),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Account Setting",
                    style: TextStyle(
                        fontSize: allsize * 0.02, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "My Profile",
                          style: TextStyle(
                              color: const Color(0xff006ccf),
                              fontSize: allsize * 0.016),
                        ),
                        Icon(
                          Icons.edit,
                          color: const Color(0xff006ccf),
                          size: allsize * 0.02,
                        )
                      ],
                    )),
                MyProfileRow(title: "Name:", value: "Abcdef Ghijkl"),
                MyProfileRow(title: "Date of Birth:", value: "12/24/1999"),
                MyProfileRow(title: "Email:", value: "abcdefg@gmail.com"),
                MyProfileRow(title: "Password:", value: "******"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "My Orders",
                      style: TextStyle(
                          color: const Color(0xff006ccf),
                          fontSize: allsize * 0.016,
                          fontWeight: FontWeight.bold),
                    )),
                // Pending Orders
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "Pending",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: allsize * 0.012,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "(VIEW ALL)",
                            style: TextStyle(
                                color: const Color(0xff006ccf),
                                fontSize: allsize * 0.012),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.grey[300],
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            "Date",
                            style: TextStyle(fontSize: allsize * 0.0115),
                          )),
                          TableCell(
                              child: Text("Order #",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Total",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                        ])
                      ],
                    ),
                  ),
                ),
                //Shipped
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "Shipped",
                        style: TextStyle(
                            color: Colors.grey, fontSize: allsize * 0.012),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "(VIEW ALL)",
                            style: TextStyle(
                                color: const Color(0xff006ccf),
                                fontSize: allsize * 0.012),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.grey[300],
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text("Date",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Order #",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Total",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Tracking",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                        ])
                      ],
                    ),
                  ),
                ),
                //Declined
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "Declined",
                        style: TextStyle(
                            color: Colors.grey, fontSize: allsize * 0.012),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "(VIEW ALL)",
                            style: TextStyle(
                                color: const Color(0xff006ccf),
                                fontSize: allsize * 0.012),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.grey[300],
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text("Date",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Order #",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                          TableCell(
                              child: Text("Total",
                                  style: TextStyle(fontSize: allsize * 0.0115))),
                        ])
                      ],
                    ),
                  ),
                ),

                //My Pull List
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "My Pull List",
                      style: TextStyle(
                          color: const Color(0xff006ccf),
                          fontSize: allsize * 0.016,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Pull List Status",
                      style: TextStyle(
                          color: Colors.grey, fontSize: allsize * 0.0112),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: active,
                            groupValue: active == true ? true : false,
                            onChanged: (val) {
                              setState(() {
                                active = val!;
                              });
                            }),
                        Text(
                          "Active",
                          style: TextStyle(fontSize: allsize * 0.012),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: active,
                            groupValue: active == true ? false : true,
                            onChanged: (val) {
                              setState(() {
                                active = val!;
                              });
                            }),
                        Text("Inactive",
                            style: TextStyle(fontSize: allsize * 0.012))
                      ],
                    ),
                  ],
                ),
                //Subcription Type
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.04,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Subscription Type",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Shipping Frequency
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: size.height * 0.04,
                    // color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Shipping Frequency",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Location
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.04,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Location",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Shipping Address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: size.height * 0.04,
                    // color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Shipping Address",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Save Pull List Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.07,
                    color: const Color(0xff006ccf),
                    child: Center(
                      child: Text(
                        "SAVE PULL SETTINGS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "My Preview",
                      style: TextStyle(
                          color: const Color(0xff006ccf),
                          fontSize: allsize * 0.016,
                          fontWeight: FontWeight.bold),
                    )),
                //Credit Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: size.height * 0.04,
                    // color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text(
                            "Credit Card",
                            style: TextStyle(fontSize: allsize * 0.012),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Billing Address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.04,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Billing Address",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Shipping Frequency
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: size.height * 0.04,
                    // color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Sipping Frequency",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Shipping Address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.04,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Shipping Address",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Shipping Method
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: size.height * 0.04,
                    // color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text("Shipping Method",
                              style: TextStyle(fontSize: allsize * 0.012)),
                        ],
                      ),
                    ),
                  ),
                ),
                //Save Preview Setting Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.07,
                    color: const Color(0xff006ccf),
                    child: Center(
                      child: Text(
                        "SAVE PREVIEW SETTINGS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: allsize * 0.016,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const SubcribeWidget(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(
              ontap: () => scaffoldKey.currentState!.openDrawer(),
            )
          ],
        ),
      ),
    );
  }
}
