import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
                    "My Orders",
                    style: TextStyle(
                      fontSize: allsize * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Order In Process
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Orders in Process",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Text(
                                      "Date",
                                      style:
                                          TextStyle(fontSize: allsize * 0.0115),
                                    )),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115)))
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Order Process
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Orders Process / Shipped and Completed",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Tracking",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115)))
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Order Declined
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Orders Declined",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: allsize * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Order Cancelled
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Orders Cancelled",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Arcieve Orders
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Archive Orders",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.0115))),
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
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
