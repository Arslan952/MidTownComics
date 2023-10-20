import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class BrowsePullList extends StatefulWidget {
  const BrowsePullList({super.key});

  @override
  State<BrowsePullList> createState() => _BrowsePullListState();
}

class _BrowsePullListState extends State<BrowsePullList> {
  bool defaultshipping = true;
  bool defaultbilling = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "My Pull List",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Welcome to the Midtown Comics Pull List Program",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "1. To get started, browse our Pull list titles below, or use the search box below"
                                "to look for the title you'd like to subscribe to.\n"
                                "2.Once you've selected ten or more monthly titles ,click Save and Continuous\n"
                                "3. On the following page, you'll be prompted to fill in the shipping and billing information",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.07,
                    color: const Color(0xff006ccf),
                    child: const Center(
                      child: Text(
                        "CONTINUE TO MY PULL LIST",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
