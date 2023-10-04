import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyPreOrderScreen extends StatefulWidget {
  const MyPreOrderScreen({super.key});

  @override
  State<MyPreOrderScreen> createState() => _MyPreOrderScreenState();
}

class _MyPreOrderScreenState extends State<MyPreOrderScreen> {
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
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.16),
                    Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "My Pre-Orders",
                    style: TextStyle(fontSize:allsize*0.02, fontWeight: FontWeight.bold),
                  ),
                ),
                //Order In Process
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
                              "Approved Data",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
                                  fontSize: allsize*0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children:  [
                                  TableRow(children: [
                                    TableCell(child: Text("Date",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Order#",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Total",style: TextStyle(fontSize: allsize*0.011)))
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
                              "Shipped Order",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
                                  fontSize:  allsize*0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children:  [
                                  TableRow(children: [
                                    TableCell(child: Text("Date",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Order#",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Total",style: TextStyle(fontSize: allsize*0.011))),
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
                              "Pending Order",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
                                  fontSize: allsize*0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children:  [
                                  TableRow(children: [
                                    TableCell(child: Text("Date",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Order#",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Total",style: TextStyle(fontSize: allsize*0.011))),
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
                              "Cancelled Order",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
                                  fontSize:  allsize*0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children:  [
                                  TableRow(children: [
                                    TableCell(child: Text("Date",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Order#",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Total",style: TextStyle(fontSize: allsize*0.011))),
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
                              "Declined Order",
                              style: TextStyle(
                                  color: Color(0xff006ccf),
                                  fontSize: allsize*0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              color: Colors.grey[200],
                              child: Table(
                                children:   [
                                  TableRow(children: [
                                    TableCell(child: Text("Date",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Order#",style: TextStyle(fontSize: allsize*0.011))),
                                    TableCell(child: Text("Total",style: TextStyle(fontSize: allsize*0.011))),
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
                SizedBox(height: size.height*0.02,),
                Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(ontap:() => scaffoldKey.currentState!.openDrawer(),)
          ],
        ),
      ),
    );
  }
}
