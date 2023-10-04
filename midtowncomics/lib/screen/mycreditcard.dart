import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyCreditCard extends StatefulWidget {
  const MyCreditCard({super.key});

  @override
  State<MyCreditCard> createState() => _MyCreditCardState();
}

class _MyCreditCardState extends State<MyCreditCard> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
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
                SizedBox(height: size.height * 0.165),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My Credit Cards",
                      style: TextStyle(
                          fontSize: allsize * 0.02,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff006ccf), width: 3)),
                    child: Center(
                      child: Text(
                        "ADD NEW CARD",
                        style: TextStyle(
                            color: const Color(0xff006ccf),
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
