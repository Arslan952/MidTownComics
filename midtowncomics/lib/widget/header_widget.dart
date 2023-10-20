// ignore_for_file: must_be_immutable, camel_case_types

import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midtowncomics/screen/loginscreen.dart';
import 'package:midtowncomics/screen/seachpage.dart';
import 'package:midtowncomics/services/apirequest.dart';
import 'package:midtowncomics/widget/customdialouge1.dart';
import 'package:midtowncomics/widget/searchcustomdialaugue.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';
import 'customdialaugue2.dart';
import 'customdialugue3.dart';

class Header_Widget extends StatefulWidget {
  TextEditingController?searchcontroller;
  Function() ontap;

  Header_Widget({
    super.key,
    required this.ontap,
    this.searchcontroller
  });

  @override
  State<Header_Widget> createState() => _Header_WidgetState();
}

class _Header_WidgetState extends State<Header_Widget> {
  final FocusNode _focusNode = FocusNode();
  bool _showIcon = true;
  @override
  void initState() {
    super.initState();
    widget.searchcontroller?.addListener(() {
      final provider=Provider.of<StreamedDataProvider>(context,listen: false);
      provider.updatesearchselextion(widget.searchcontroller!.text);
      provider.searchlist(true);
      if (widget.searchcontroller!.text.isEmpty) {
        Provider.of<StreamedDataProvider>(context, listen: false).removesearchdata();
      } else {
        ApiRequests().SearchApi(widget.searchcontroller!.text,provider.title=="All"?"":provider.title,'10','0','0'," "," ","","",""," ","","","","","", false,"",context);
      }
    });
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
                              Provider.of<StreamedDataProvider>(context,
                                  listen: false);
                          Map<String, dynamic> data =
                              await ApiRequests().fetchData1(provider.loginuserdata.isEmpty?"":provider.loginuserdata['sh_id']);
                          streamedDataProvider.updateData(data);
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
                          provider.loginuserdata.isEmpty?Get.to(const SignInScreen()):
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialugue3();
                            },
                          );
                        },
                        icon: badges.Badge(
                          showBadge: provider.cartdata['DATA'] == null || provider.loginuserdata.isEmpty
                              ? false
                              : true,
                          onTap: () {
                          },
                          badgeAnimation: const badges.BadgeAnimation.scale(
                            animationDuration: Duration(seconds: 1),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: false,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.easeInCubic,
                          ),
                          badgeContent: Text(
                            "2",
                            style: TextStyle(
                                color: Colors.white, fontSize: allsize * 0.01),
                          ),
                          child: Icon(
                            Icons.book,
                            color: Colors.white,
                            size: allsize * 0.02,
                          ),
                        ),
                      ),
                      Consumer<StreamedDataProvider>(
                          builder: (context, provider, child) {
                            // if (provider.searchselection != "") {
                            //   searchcontroller.text = provider.searchselection;
                            // }
                        List<dynamic> cartdatalist =
                            provider.cartdata['DATA'] == null
                                ? []
                                : provider.cartdata['DATA']['cartList'];
                        double totalprice = double.parse(
                            provider.cartdata['DATA'] == null
                                ? "0"
                                : cartdatalist[0]['cart_total']);
                        int convert = totalprice.toInt();
                        String totalnumber = provider.cartdata['DATA'] == null
                            ? ""
                            : cartdatalist[0]['cart_total_qty'];
                        double badgeSize;
                        if (totalnumber.length == 1) {
                          badgeSize =
                              allsize * 0.013; // Adjust badge size for 1 digit
                        } else if (totalnumber.length == 2) {
                          badgeSize =
                              allsize * 0.008; // Adjust badge size for 2 digits
                        } else if (totalnumber.length == 3) {
                          badgeSize =
                              allsize * 0.007; // Adjust badge size for 3 digits
                        } else {
                          badgeSize = allsize * 0.01; // Default badge size
                        }
                        return Padding(
                          padding: EdgeInsets.only(right: size.width * 0.05),
                          child: IconButton(
                              onPressed: () {
                                provider.loginuserdata.isEmpty?Get.to(const SignInScreen()):
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const CustomDialougue2();
                                  },
                                );
                              },
                              icon: badges.Badge(
                                showBadge: provider.cartdata['DATA'] == null || provider.loginuserdata.isEmpty
                                    ? false
                                    : true,
                                position: badges.BadgePosition.topEnd(),
                                badgeAnimation:
                                    const badges.BadgeAnimation.scale(
                                  animationDuration: Duration(seconds: 1),
                                  colorChangeAnimationDuration:
                                      Duration(seconds: 1),
                                  loopAnimation: false,
                                  curve: Curves.fastOutSlowIn,
                                  colorChangeAnimationCurve: Curves.easeInCubic,
                                ),
                                badgeStyle: badges.BadgeStyle(
                                  badgeColor: totalprice > 89
                                      ? Colors.green
                                      : Colors.red,
                                  padding: const EdgeInsets.all(5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                badgeContent: Text(
                                  totalnumber,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: badgeSize),
                                ),
                                child: Icon(
                                  CupertinoIcons.cart_fill,
                                  color: Colors.white,
                                  size: allsize * 0.02,
                                ),
                              )),
                        );
                      }),
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
                          // height: size.height * 0.052,
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
                                    height: size.height * 0.06,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context)
                                                      .size
                                                      .shortestSide <
                                                  550
                                              ? allsize * 0.013
                                              : allsize * 0.007),
                                      child: Text(
                                        provider.title,
                                        style: TextStyle(
                                            fontSize: allsize * 0.013),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.59,
                                child: TextFormField(
                                  focusNode: _focusNode,
                                  controller: widget.searchcontroller,
                                  textInputAction: TextInputAction.search,
                                  onEditingComplete: () {
                                    provider.searchlist(false);
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SearchPage()),
                                    );
                                  },
                                  style: TextStyle(
                                    fontSize: allsize * 0.017,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    prefixIcon: _showIcon
                                        ? Icon(
                                      Icons.search,
                                      size: allsize * 0.02,
                                    )
                                        : null,
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    suffixIcon: _focusNode.hasFocus
                                        ? IconButton(
                                      onPressed: () {
                                        provider.searchlist(false);
                                        widget.searchcontroller!.clear();
                                        provider.removesearchdata();
                                        provider.updatesearchselextion("");
                                        _focusNode.unfocus();
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
