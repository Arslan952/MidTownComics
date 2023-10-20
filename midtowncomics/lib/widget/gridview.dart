import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/streamdataprovider.dart';
import 'CustomProductDialugue.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Consumer<StreamedDataProvider>(builder: (context, provider, child) {
      DateTime dateTime = DateFormat("MM/dd/yyyy hh:mm a").parse(provider.streamedData['DATA']['DODSummary']['dealdate']);
      int endTime = dateTime.millisecondsSinceEpoch;
      return Padding(
        padding: EdgeInsets.all(allsize * 0.005),
        child: GridView.count(
          mainAxisSpacing: allsize * 0.01,
          crossAxisSpacing: allsize * 0.01,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.shortestSide < 550
              ? (2 / 4.25)
              : (2 / 2.7),
          children: [
            //New to Mid tOWN
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['shopperSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          provider.loginuserdata.isEmpty?
                          "New to Midtown\n"
                          "Comics?":"Welcome ${provider.loginuserdata['sh_fname']}",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            provider.streamedData['DATA']['shopperSummary']
                                        ['hideadultimage'] ==
                                    "0"
                                ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['shopperSummary']['pr_id']}_ful.jpg"
                                : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),

                        Text(
                          provider.loginuserdata.isEmpty?
                          "Sign In/ Create an Account":"",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0115),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          provider.loginuserdata.isEmpty?
                          "For the best browsing\n experience!":"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0125),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //New Release
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['weeklyReleaseSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          'New Release',
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            provider.streamedData['DATA']['weeklyReleaseSummary']
                                        ['hideadultimage'] ==
                                    "0"
                                ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['weeklyReleaseSummary']['pr_id']}_ful.jpg"
                                : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Text(
                          "Updated Every Wednesday",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0125),
                        ),
                        Text(
                          "${provider.streamedData['DATA']['weeklyReleaseSummary']['comicsDatesList'][0]['display_text']}/"
                          "${provider.streamedData['DATA']['weeklyReleaseSummary']['comicsDatesList'][1]['display_text']}/"
                          "${provider.streamedData['DATA']['weeklyReleaseSummary']['comicsDatesList'][2]['display_text']}/"
                          "${provider.streamedData['DATA']['weeklyReleaseSummary']['comicsDatesList'][3]['display_text']}/"
                          "${provider.streamedData['DATA']['weeklyReleaseSummary']['comicsDatesList'][4]['display_text']}",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0115),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //My Pull List
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['pullListSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          "My Pull List",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            provider.streamedData['DATA']['pullListSummary']
                                        ['hideadultimage'] ==
                                    "0"
                                ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['pullListSummary']['pr_id']}_ful.jpg"
                                : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Text(
                          "Never Miss An Issue!\n"
                          "Update Pull-List Setting",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[500]!,
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0125),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Pre Order
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['preOrdersSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          "Pre Order",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            provider.streamedData['DATA']['preOrdersSummary']
                                        ['hideadultimage'] ==
                                    "0"
                                ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['preOrdersSummary']['pr_id']}_ful.jpg"
                                : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Text(
                          "Save Up to 50%\n"
                          "on upcoming orders",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0125),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //My Wish List
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['wishListSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          "My Wish List",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            provider.streamedData['DATA']['wishListSummary']
                                        ['hideadultimage'] ==
                                    "0"
                                ? "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['wishListSummary']['pr_id']}_ful.jpg"
                                : 'https://www.midtowncomics.com/images/PRODUCT/FUL/adults_ful.jpg',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Text(
                          "Never Miss an Issue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: allsize * 0.0125),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Deals of the Day
            InkWell(
              onTap: (){
                provider.chanddetai({});
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomPrdoductDiallugue(
                      productid:provider.streamedData['DATA']['DODSummary']['pr_id'],
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(allsize * 0.01),
                    child: Column(
                      children: [
                        Text(
                          "Deals of the Day",
                          style: TextStyle(
                              color: const Color(0xff1569b4),
                              fontSize: allsize * 0.016,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: Image.network(
                            "https://www.midtowncomics.com/images/PRODUCT/FUL/${provider.streamedData['DATA']['DODSummary']['pr_id']}_ful.jpg",
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "50% OFF!",
                              style: TextStyle(
                                  fontSize: allsize * 0.0125,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Time left:",
                                  style: TextStyle(
                                      fontSize: allsize * 0.0125,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Flexible(
                                  child: CountdownTimer(
                                    endWidget: const Center(child: Text("Offer Expired"),),
                                    textStyle: TextStyle(
                                        fontSize: allsize * 0.0125,
                                        fontWeight: FontWeight.bold),
                                    endTime: endTime,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
