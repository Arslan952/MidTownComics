import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midtowncomics/widget/customdialouge1.dart';
import 'package:midtowncomics/widget/searchcustomdialaugue.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';
import 'customdialaugue2.dart';
import 'customdialugue3.dart';
import 'package:http/http.dart'as http;

class Header_Widget extends StatefulWidget {
  Function() ontap;

  Header_Widget({
    super.key,
    required this.ontap,
  });

  @override
  State<Header_Widget> createState() => _Header_WidgetState();
}

class _Header_WidgetState extends State<Header_Widget> {
  String select = "All";
  final FocusNode _focusNode = FocusNode();
  TextEditingController searchcontroller = TextEditingController();
  bool _showIcon = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showIcon = !_focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Consumer<StreamedDataProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          Container(
            height: size.height * 0.025,
            color: const Color(0xff00365a),
            child: Center(
              child: Text(
                "Free Shipping on all quality orders!",
                style: TextStyle(color: Colors.white, fontSize: allsize * 0.01),
              ),
            ),
          ),
          Container(
            color: const Color(0xff006ccf),
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.006,
                left: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Text(
                          "MIDTOWN COMICS",
                          style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: allsize * 0.020,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          final streamedDataProvider =
                          Provider.of<StreamedDataProvider>(context, listen: false);
                          var request = http.Request(
                              'GET',
                              Uri.parse(
                                  'https://www.midtowncomics.com/wcfmt/services/midtownprocess.svc/load-page-data-vr1?apiKey=ProductApiKey@8879kiop!&mtUser=AppUserMT@123!&mtPass=MTC007@8847!&sh_id=76367&pgn=home&rvl=1000,1002,1003&app_id='));
                          http.StreamedResponse response = await request.send();
                          if (response.statusCode == 200) {
                            await Future.delayed(const Duration(seconds: 2));
                            final data = await response.stream.bytesToString();
                            streamedDataProvider.updateData(jsonDecode(data));
                          } else {
                            print(response.reasonPhrase);
                          }
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialugue1();
                            },
                          );
                        },
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: allsize * 0.02,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialugue3();
                            },
                          );
                        },
                        icon: Badge(
                            backgroundColor: const Color(0xffdf0b14),
                            largeSize: allsize * 0.016,
                            offset: Offset(allsize * 0.01, -allsize * 0.005),
                            // position: BadgePosition.bottomRight(allsize * 0.01),
                            label: Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: allsize * 0.01),
                            ),
                            child: Icon(
                              Icons.book,
                              color: Colors.white,
                              size: allsize * 0.02,
                            )),
                      ),
                            Consumer<StreamedDataProvider>(builder: (context, provider, child) {
                              List<dynamic>cartdatalist=provider.cartdata['DATA']['cartList'];
                              String totalnumber=cartdatalist.isEmpty?"":cartdatalist[0]['cart_total_qty'];
                              return Padding(
                                padding: EdgeInsets.only(right: size.width * 0.05),
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialougue2();
                                      },
                                    );
                                  },
                                  icon: Badge(
                                    backgroundColor: const Color(0xffdf0b14),
                                    largeSize: allsize * 0.016,
                                    offset: Offset(allsize * 0.01, -allsize * 0.005),
                                    // position: BadgePosition.bottomRight(allsize * 0.01),
                                    label: Text(
                                      totalnumber,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: allsize * 0.01),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.cart_fill,
                                      color: Colors.white,
                                      size: allsize * 0.02,
                                    ),
                                  ),
                                ),
                              );
                            })
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.02, bottom: size.height * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: widget.ontap,
                            icon: Icon(
                              CupertinoIcons.bars,
                              color: Colors.white,
                              size: allsize * 0.025,
                            )),
                        Container(
                          color: Colors.white,
                          height: size.height * 0.052,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const SearchDialugue();
                                    },
                                  );
                                },
                                child: Container(
                                    width: size.width * 0.22,
                                    color: const Color(0xffefefef),
                                    height: size.height * 0.052,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context)
                                                      .size
                                                      .shortestSide <
                                                  550
                                              ? allsize * 0.01
                                              : allsize * 0.007),
                                      child: Text(
                                        provider.title,
                                        style: TextStyle(
                                            fontSize: allsize * 0.0125),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.59,
                                child: TextFormField(
                                  focusNode: _focusNode,
                                  controller: searchcontroller,
                                  style: TextStyle(
                                      fontSize: allsize * 0.018,
                                      fontWeight: FontWeight.w300),
                                  decoration: InputDecoration(
                                    prefixIcon: _showIcon
                                        ? Icon(
                                            Icons.search,
                                            size: allsize * 0.02,
                                          )
                                        : null,
                                    filled: true,
                                    fillColor: Colors.white,
                                    // contentPadding: const EdgeInsets.all(0.1),
                                    border: InputBorder.none,
                                    suffixIcon: _focusNode.hasFocus
                                        ? IconButton(
                                            onPressed: () {
                                              _focusNode.unfocus();
                                              searchcontroller.clear();
                                            },
                                            icon: Icon(
                                              CupertinoIcons.clear,
                                              size: allsize * 0.02,
                                              color: Colors.grey[500],
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
