import 'package:flutter/material.dart';
import 'package:midtowncomics/widget/weekly_release_Card.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class WeeklyReleaseScreen extends StatefulWidget {
  const WeeklyReleaseScreen({super.key});

  @override
  State<WeeklyReleaseScreen> createState() => _WeeklyReleaseScreenState();
}

class _WeeklyReleaseScreenState extends State<WeeklyReleaseScreen> {
  int index = 1;
  @override
  String dropdownselected = "";
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
                Material(
                  elevation: 3,
                  child: Container(
                      height: size.height * 0.06,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "SORT BY",
                                  style: TextStyle(
                                      color: Color(0xff006ccf),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.sort,
                                  color: Color(0xff006ccf),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "FILTER",
                                  style: TextStyle(
                                      color: Color(0xff006ccf),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.filter_list_rounded,
                                  color: Color(0xff006ccf),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "NOW SHOWING 263 NEW RELEASE ITEMS",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                //Weekly Release Heading
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "WEEKLY RELEASE FOR",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      Expanded(
                          child: Container(
                        height: size.height * 0.04,
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: DropdownButton<String>(
                            value: 'Option 1',
                            // T
                            style: TextStyle(color: Colors.grey[800]),
                            isExpanded: true,
                            // he initially selected value (can be null)
                            onChanged: (String? newValue) {
                              setState(() {});
                              // Handle dropdown value change here
                              // newValue contains the selected value
                            },
                            items: <String>[
                              'Option 1',
                              'Option 2',
                              'Option 3',
                              'Option 4',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    height: size.height * 0.1,
                    color: const Color(0xff006ccf),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width / 3.125,
                            color: index == 1
                                ? const Color(0xff006ccf)
                                : const Color(0xffe4e4e4),
                            child: Center(
                              child: Text(
                                "COMICS &\nGRAPHIC\nNOVELS",
                                style: TextStyle(
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width / 3.125,
                            color: index == 2
                                ? const Color(0xff006ccf)
                                : const Color(0xffe4e4e4),
                            child: Center(
                              child: Text(
                                "INDIES,BOOKS,\nMAGAZINES",
                                style: TextStyle(
                                    color: index == 2
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width / 3.125,
                            color: index == 3
                                ? const Color(0xff006ccf)
                                : const Color(0xffe4e4e4),
                            child: Center(
                              child: Text(
                                "MERCHANDISE,\nAPPAREL &\n"
                                "MORE",
                                style: TextStyle(
                                    color: index == 3
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //Banner
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.06,
                    color: const Color(0xff006ccf),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.015, left: size.width * 0.04),
                      child: Text(
                        index == 1
                            ? "Comics & Graphic Novels"
                            : index == 2
                                ? "Indies,Books and Magazines"
                                : index == 3
                                    ? "Action Figured"
                                    : "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                //Cards
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const WeeklyReleaseCard(),
                          SizedBox(
                            height: size.height * 0.01,
                          )
                        ],
                      );
                    }),
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
            Header_Widget(ontap: () => scaffoldKey.currentState!.openDrawer())
          ],
        ),
      ),
    );
  }
}
