import 'package:flutter/material.dart';
import 'package:midtowncomics/widget/banner.dart';
import 'package:midtowncomics/widget/card_grid_view2.dart';
import 'package:midtowncomics/widget/featurenewrelease.dart';
import 'package:midtowncomics/widget/footer.dart';
import 'package:midtowncomics/widget/gridview.dart';
import 'package:midtowncomics/widget/header_widget.dart';
import 'package:midtowncomics/widget/sidebar.dart';
import 'package:midtowncomics/widget/slider1.dart';
import 'package:midtowncomics/widget/slider2.dart';
import 'package:midtowncomics/widget/slider3.dart';
import 'package:midtowncomics/widget/subcribeWidget.dart';
import 'package:midtowncomics/widget/viewmorecustomdialuge.dart';
import 'package:midtowncomics/widget/weekly_release_button.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  void _precacheImages(List<dynamic> imageUrls) {
    for (final imageUrl in imageUrls) {
      precacheImage(
          NetworkImage(
              "https://www.midtowncomics.com/images/PRODUCT/FUL/${imageUrl['pr_id']}_ful.jpg"),
          context);
    }
  }

  bool isListLengthEven(List<dynamic> myList) {
    return myList.length % 2 == 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  void scrollToNextItem() {
    final int nextItemScrollPosition =
        _scrollController.position.extentAfter as int;
    _scrollController.animateTo(nextItemScrollPosition as double,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: const Custom_drawer(),
        backgroundColor: const Color(0xfff6f6f6),
        body:
            Consumer<StreamedDataProvider>(builder: (context, provider, child) {
          List<dynamic> crossoverlist =
              provider.streamedData['DATA']['sCrossOversList'];
          List<dynamic> recommendedforyou = provider.streamedData['DATA']
              ['recommendedForYouSection']['productList'];
          List<dynamic> featurenewrelease = provider.streamedData['DATA']
              ['newReleasesSection']['productList'];
          List<dynamic> recomendedpreorder = provider.streamedData['DATA']
              ['recommendedPreOrdersSection']['productList'];
          List<dynamic> recomendedbackissue = provider.streamedData['DATA']
              ['recommendedBISection']['productList'];
          List<dynamic> bestSeller = provider.streamedData['DATA']
              ['bestSellersSection']['productList'];
          List<dynamic> exclusive =
              provider.streamedData['DATA']['mtExlusiveSection']['productList'];
          return SafeArea(
              child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.153),
                    HomeScreenBanner(),
                    const WeeklyReleaseButton(),
                    const Slider1(),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      child: Slider2(),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const CardGridView(),
                    Consumer<StreamedDataProvider>(
                        builder: (context, provider, child) {
                      List<dynamic> data =
                          provider.streamedData['DATA']['pageBanner1List'];
                      return Slider3(
                        data: data,
                      );
                    }),
                    Consumer<StreamedDataProvider>(
                        builder: (context, provider, child) {
                      List<dynamic> data =
                          provider.streamedData['DATA']['pageBanner2List'];
                      return Slider3(
                        data: data,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.48,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Featured New Release",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (featurenewrelease.length / 2)
                                      .ceil(), // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(featurenewrelease);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment:
                                            endIndex <= featurenewrelease.length
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                featurenewrelease.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage:
                                                      featurenewrelease[index]
                                                          ['hideadultimage'],
                                                  pulllist:
                                                      featurenewrelease[index]
                                                          ['su_id'],
                                                  image:
                                                      featurenewrelease[index]
                                                          ['pr_id'],
                                                  title:
                                                      featurenewrelease[index]
                                                          ['pr_ttle'],
                                                  prce1:
                                                      featurenewrelease[index]
                                                          ['pr_price'],
                                                  price2:
                                                      featurenewrelease[index]
                                                          ['pr_lprice'],
                                                  preorder:
                                                      featurenewrelease[index]
                                                          ['pr_advord'],
                                                  quantity: int.parse(
                                                      featurenewrelease[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.grey[200],
                        height: size.height * 0.17,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text("SERIES/CROSSOVER",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: allsize * 0.0143,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: size.height * 0.11,
                              child: RawScrollbar(
                                thumbColor: Colors.grey,
                                thickness: allsize * 0.003,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.03,
                                      horizontal: size.width * 0.03),
                                  child: ListView.builder(
                                      itemCount: crossoverlist.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (item, index) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.1,
                                              width: size.width * 0.2,
                                              child: Image.network(
                                                crossoverlist[index]['img_url'],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.48,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recommended For You",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (recommendedforyou.length / 2)
                                      .ceil(), // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(recommendedforyou);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment:
                                            endIndex <= recommendedforyou.length
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                recommendedforyou.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage:
                                                      recommendedforyou[index]
                                                          ['hideadultimage'],
                                                  pulllist:
                                                      recommendedforyou[index]
                                                          ['su_id'],
                                                  image:
                                                      recommendedforyou[index]
                                                          ['pr_id'],
                                                  title:
                                                      recommendedforyou[index]
                                                          ['pr_ttle'],
                                                  prce1:
                                                      recommendedforyou[index]
                                                          ['pr_price'],
                                                  price2:
                                                      recommendedforyou[index]
                                                          ['pr_lprice'],
                                                  preorder:
                                                      recommendedforyou[index]
                                                          ['pr_advord'],
                                                  quantity: int.parse(
                                                      recommendedforyou[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          provider.streamedData['DATA']['pageBanner3']
                              ['image_url'],
                          // Use the 'image' field from your data
                          fit: BoxFit.fill,
                          width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.48,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recommended Pre-Order",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (recomendedpreorder.length / 2)
                                      .ceil(), // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(recomendedpreorder);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                recomendedpreorder.length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                recomendedpreorder.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage:
                                                      recomendedpreorder[index]
                                                          ['hideadultimage'],
                                                  pulllist:
                                                      recomendedpreorder[index]
                                                          ['su_id'],
                                                  image:
                                                      recomendedpreorder[index]
                                                          ['pr_id'],
                                                  title:
                                                      recomendedpreorder[index]
                                                          ['pr_ttle'],
                                                  prce1:
                                                      recomendedpreorder[index]
                                                          ['pr_price'],
                                                  price2:
                                                      recomendedpreorder[index]
                                                          ['pr_lprice'],
                                                  preorder:
                                                      recomendedpreorder[index]
                                                          ['pr_advord'],
                                                  quantity: int.parse(
                                                      recomendedpreorder[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.48,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recommended Back Issue",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (recomendedbackissue.length / 2)
                                      .ceil(), // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(recomendedbackissue);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                recomendedbackissue.length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                recomendedbackissue.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage:
                                                      recomendedbackissue[index]
                                                          ['hideadultimage'],
                                                  pulllist:
                                                      recomendedbackissue[index]
                                                          ['su_id'],
                                                  image:
                                                      recomendedbackissue[index]
                                                          ['pr_id'],
                                                  title:
                                                      recomendedbackissue[index]
                                                          ['pr_ttle'],
                                                  prce1:
                                                      recomendedbackissue[index]
                                                          ['pr_price'],
                                                  price2:
                                                      recomendedbackissue[index]
                                                          ['pr_lprice'],
                                                  preorder:
                                                      recomendedbackissue[index]
                                                          ['pr_advord'],
                                                  quantity: int.parse(
                                                      recomendedbackissue[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
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
                    //Best Seller
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.48,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Best Seller",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (bestSeller.length / 2).ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(bestSeller);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment:
                                            endIndex <= bestSeller.length
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index < bestSeller.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: bestSeller[index]
                                                      ['hideadultimage'],
                                                  pulllist: bestSeller[index]
                                                      ['su_id'],
                                                  image: bestSeller[index]
                                                      ['pr_id'],
                                                  title: bestSeller[index]
                                                      ['pr_ttle'],
                                                  prce1: bestSeller[index]
                                                      ['pr_price'],
                                                  price2: bestSeller[index]
                                                      ['pr_lprice'],
                                                  preorder: bestSeller[index]
                                                      ['pr_advord'],
                                                  quantity: int.parse(
                                                      bestSeller[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * 0.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Featured Midtown Comics\n'
                                    'Signed/Exclusive',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: allsize * 0.0143,
                                        fontWeight: FontWeight.w400)),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ViewMoreCustomDialugue();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.4,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "View More",
                                        style: TextStyle(
                                            fontSize: allsize * 0.0143),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.43,
                              child: Scrollbar(
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount: (exclusive.length / 2).ceil(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    _precacheImages(exclusive);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment:
                                            endIndex <= exclusive.length
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index < exclusive.length)
                                              SizedBox(
                                                // width: MediaQuery.of(context).size.width * 0.47962, // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: exclusive[index]
                                                      ['hideadultimage'],
                                                  pulllist: exclusive[index]
                                                      ['su_id'],
                                                  image: exclusive[index]
                                                      ['pr_id'],
                                                  title: exclusive[index]
                                                      ['pr_ttle'],
                                                  prce1: exclusive[index]
                                                      ['pr_price'],
                                                  price2: exclusive[index]
                                                      ['pr_lprice'],
                                                  preorder: exclusive[index]
                                                      ['pr_advord'],
                                                  quantity: int.parse(
                                                      exclusive[index]
                                                          ['pr_qty']),
                                                ),
                                              ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const CardGridView2(),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          provider.streamedData['DATA']['pageBanner4']
                              ['image_url'],
                          // Use the 'image' field from your data
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                          // width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          provider.streamedData['DATA']['pageBanner5']
                              ['image_url'],
                          // Use the 'image' field from your data
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                          width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          provider.streamedData['DATA']['pageBanner6']
                              ['image_url'],
                          // Use the 'image' field from your data
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                          width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
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
                ),
              ),
              Header_Widget(
                ontap: () => scaffoldKey.currentState!.openDrawer(),
              )
            ],
          ));
        }));
  }
}
