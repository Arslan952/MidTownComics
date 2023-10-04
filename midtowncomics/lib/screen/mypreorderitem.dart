import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyPreOrder extends StatefulWidget {
  const MyPreOrder({super.key});

  @override
  State<MyPreOrder> createState() => _MyPreOrderState();
}

class _MyPreOrderState extends State<MyPreOrder> {
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
                SizedBox(height: size.height * 0.16),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "My Pre-Order Item",
                      style: TextStyle(
                          fontSize: allsize * 0.02,
                          fontWeight: FontWeight.bold),
                    )),
                //Pending Item
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pending Items",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
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
                                        child: Text("Order",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Order#",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("QTY",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Rele",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Price",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Processed Item",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
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
                                        child: Text("Order",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("DateOrder",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("#Title",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("QTY",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Release",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Price",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Each",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cancelled Item",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
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
                                        child: Text("Order",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("DateOrder",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Total",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("#Title",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("QTY",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Release",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Date",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Price",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
                                    TableCell(
                                        child: Text("Each",
                                            style: TextStyle(
                                                fontSize: allsize * 0.011))),
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
                Footer(),
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
