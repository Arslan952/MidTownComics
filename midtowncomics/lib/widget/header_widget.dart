// ignore_for_file: must_be_immutable, camel_case_types

import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:midtowncomics/export.dart';
import 'package:midtowncomics/widget/dialagueBox/customdialugue3.dart';
import '../screen/homescreen.dart';
import 'dialagueBox/customdialaugue2.dart';
import 'dialagueBox/customdialouge1.dart';

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

  bool get isTablet {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final logicalShortestSide =
        firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
    return logicalShortestSide > 600;
  }

  @override
  void initState() {
    super.initState();
    widget.searchcontroller?.addListener(() {
      final provider =
      Provider.of<StreamedDataProvider>(context, listen: false);
      provider.updatesearchselextion(widget.searchcontroller!.text);
      provider.searchlist(true);
      if (widget.searchcontroller!.text.isEmpty) {
        Provider.of<StreamedDataProvider>(context, listen: false)
            .removesearchdata();
      } else {
        ApiRequests().SearchApi(
            provider.loginuserdata['sh_id']??"",
            widget.searchcontroller!.text,
            provider.title == "All" ? "" : provider.title,
            '10',
            '0',
            '0',
            " ",
            " ",
            "",
            "",
            "",
            " ",
            "",
            "",
            "",
            "",
            "",
            false,
            "",
            context);
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
      return Container(
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius:0.1,
                offset: Offset(0, 0.6), // Right and bottom shadow
              ),
            ]
        ),
        child: Container(
          height: allsize*0.107,
          color: const Color(0xff006ccf),
          child: Column(
            children: [
              Container(
                height: size.height * 0.025,
                color: const Color(0xff00365a),
                child: Center(
                  child: Text(
                    "Free Shipping on all quality orders!",
                    style: TextStyle(color: Colors.white, fontSize: allsize * 0.011),
                  ),
                ),
              ),
              Container(
                color: const Color(0xff006ccf),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top:allsize*0.0065),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child:Image.asset('assets/images/midtown.png',width: size.width*0.52,height: size.height*0.045,),
                                  // Text(
                                  //   "MIDTOWN COMICS",
                                  //   style: GoogleFonts.oswald(
                                  //     color: Colors.white,
                                  //       // fontFamily: "oswald_bold",
                                  //       fontStyle: FontStyle.italic,
                                  //       fontSize: allsize * 0.0213,
                                  //       fontWeight: FontWeight.bold,
                                  //   )
                                  //   // TextStyle(
                                  //   //   color: Colors.white,
                                  //   //   fontFamily: "oswald_bold",
                                  //   //   fontStyle: FontStyle.italic,
                                  //   //   fontSize: allsize * 0.0213,
                                  //   //   fontWeight: FontWeight.bold,
                                  //   // ),
                                  // ),
                                  onTap: () async {
                                    // widget.searchcontroller!.clear();
                                    final streamedDataProvider =
                                    Provider.of<StreamedDataProvider>(context,
                                        listen: false);
                                    Get.off(const HomeScreen());
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                    Map<String, dynamic> data = await ApiRequests()
                                        .fetchData1(provider.loginuserdata.isEmpty
                                        ? ""
                                        : provider.loginuserdata['sh_id']);
                                    streamedDataProvider.updateData(data);

                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.025),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const CustomDialugue1();
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: allsize * 0.02,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Consumer<StreamedDataProvider>(
                              builder: (context, provider, child) {
                                List<dynamic> pullListDataList =
                                provider.pullListData['DATA'] == null
                                    ? []
                                    : provider.pullListData['DATA']['SubscribedPullList'];
                                List<dynamic>regular= pullListDataList
                                    .where((element) => element['su_count']== "1")
                                    .toList();
                                String totalnumber = pullListDataList.length.toString();
                                double badgeSize;
                                if (totalnumber.length == 1) {
                                  badgeSize = allsize *
                                      0.013; // Adjust badge size for 1 digit
                                } else if (totalnumber.length == 2) {
                                  badgeSize = allsize *
                                      0.008; // Adjust badge size for 2 digits
                                } else if (totalnumber.length == 3) {
                                  badgeSize = allsize *
                                      0.007; // Adjust badge size for 3 digits
                                } else {
                                  badgeSize = allsize * 0.01; // Default badge size
                                }
                                return InkWell(
                                  onTap: () {
                                    provider.loginuserdata.isEmpty
                                        ? Get.to(const SignInScreen())
                                        : showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialugue3();
                                      },
                                    );
                                  },
                                  child: badges.Badge(
                                    onTap: (){
                                      provider.loginuserdata.isEmpty
                                          ? Get.to(const SignInScreen())
                                          : showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const CustomDialugue3();
                                        },
                                      );
                                    },
                                    position: badges.BadgePosition.topEnd(),
                                    showBadge:
                                    provider.loginuserdata.isEmpty || pullListDataList.isEmpty ? false : true,
                                    badgeAnimation: const badges.BadgeAnimation
                                        .scale(
                                      animationDuration: Duration(seconds: 1),
                                      colorChangeAnimationDuration:
                                      Duration(seconds: 1),
                                      loopAnimation: false,
                                      curve: Curves.fastOutSlowIn,
                                      colorChangeAnimationCurve: Curves
                                          .easeInCubic,
                                    ),
                                    badgeStyle:badges.BadgeStyle(
                                      badgeColor: regular.length >=10
                                          ? Colors.green
                                          : const Color(0xffd40e11),
                                      padding: const EdgeInsets.all(5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    badgeContent: Text(
                                      totalnumber,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: badgeSize,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.book,
                                      color: Colors.white,
                                      size: allsize * 0.02,
                                    ),
                                  ),
                                );
                              }),

                          Consumer<StreamedDataProvider>(
                            builder: (context, provider, child) {
                              List<dynamic> cartdatalist =
                              provider.cartdata['DATA'] == null
                                  ? []
                                  : provider.cartdata['DATA']['cartList'];
                              double totalprice = double.parse(
                                  provider.cartdata['DATA'] == null
                                      ? "0"
                                      : cartdatalist[0]['cart_total']);
                              String totalnumber = provider.cartdata['DATA'] == null
                                  ? ""
                                  : cartdatalist[0]['cart_total_qty'];
                              double badgeSize;
                              if (totalnumber.length == 1) {
                                badgeSize = allsize *
                                    0.013; // Adjust badge size for 1 digit
                              } else if (totalnumber.length == 2) {
                                badgeSize = allsize *
                                    0.008; // Adjust badge size for 2 digits
                              } else if (totalnumber.length == 3) {
                                badgeSize = allsize *
                                    0.007; // Adjust badge size for 3 digits
                              } else {
                                badgeSize = allsize * 0.01; // Default badge size
                              }
                              return Padding(
                                padding: EdgeInsets.only(right: size.width * 0.05),
                                child: InkWell(
                                  onTap: () {
                                    provider.loginuserdata.isEmpty
                                        ? Get.to(const SignInScreen())
                                        : showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialougue2();
                                      },
                                    );
                                  },
                                  child: badges.Badge(
                                    onTap: (){
                                      provider.loginuserdata.isEmpty
                                          ? Get.to(const SignInScreen())
                                          : showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const CustomDialougue2();
                                        },
                                      );
                                    },
                                    showBadge:
                                    provider.cartdata['DATA'] == null ||
                                        provider.loginuserdata.isEmpty
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
                                      colorChangeAnimationCurve:
                                      Curves.easeInCubic,
                                    ),
                                    badgeStyle: badges.BadgeStyle(
                                      badgeColor: totalprice > 89
                                          ? Colors.green
                                          : const Color(0xffd40e11),
                                      padding: const EdgeInsets.all(5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    badgeContent: Text(
                                      totalnumber,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: badgeSize,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: allsize * 0.021,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
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
                                  size: allsize * 0.022,
                                )),
                            Flexible(
                              child: Container(
                                color: Colors.white,
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
                                          height: allsize*0.034,
                                          child: Padding(
                                            padding: EdgeInsets.all(allsize*0.0068),
                                            child: Text(
                                              provider.title,
                                              style: TextStyle(
                                                fontSize: allsize * 0.0138,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                    ),
                                    // Flexible(
                                    //   child: SizedBox(
                                    //     height: allsize*0.034,
                                    //     child: TextFormField(
                                    //       focusNode: _focusNode,
                                    //       controller: widget.searchcontroller,
                                    //       textInputAction: TextInputAction.search,
                                    //       onEditingComplete: () {
                                    //         provider.searchlist(false);
                                    //         FocusScope.of(context).unfocus();
                                    //         Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                 const SearchPage()));
                                    //       },
                                    //       style: const TextStyle(
                                    //         // height: 1
                                    //         // fontSize: allsize * 0.017,
                                    //         // fontWeight: FontWeight.w300,
                                    //       ),
                                    //       maxLines: 1,
                                    //       // textAlignVertical: TextAlignVertical.center,
                                    //       decoration:  InputDecoration(
                                    //         contentPadding:EdgeInsets.all(allsize*0.013),
                                    //         prefixIcon: _showIcon
                                    //             ? Icon(
                                    //           Icons.search_outlined,
                                    //           size: allsize * 0.02,
                                    //         )
                                    //             : null,
                                    //         filled: true,
                                    //         fillColor: Colors.white,
                                    //         border: InputBorder.none,
                                    //         // suffixIcon: _focusNode.hasFocus
                                    //         //     ? IconButton(
                                    //         //   padding: EdgeInsets.zero,
                                    //         //   onPressed: () {
                                    //         //     provider.searchlist(false);
                                    //         //     widget.searchcontroller!.clear();
                                    //         //     provider.removesearchdata();
                                    //         //     provider
                                    //         //         .updatesearchselextion("");
                                    //         //     _focusNode.unfocus();
                                    //         //   },
                                    //         //   icon: Icon(
                                    //         //     CupertinoIcons.clear,
                                    //         //     size: allsize * 0.02,
                                    //         //     color: Colors.grey[500],
                                    //         //   ),
                                    //         // )
                                    //         //     : const SizedBox.shrink(),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Flexible(
                                      child: Container( // Wrap in a Container for better padding control
                                        height: allsize * 0.034,
                                        alignment: Alignment.center, // Align the text field
                                        child: TextFormField(
                                          focusNode: _focusNode,
                                          controller: widget.searchcontroller,
                                          textInputAction: TextInputAction.search,
                                          onEditingComplete: () {
                                            provider.searchlist(false);
                                            FocusScope.of(context).unfocus();
                                            Get.off(SearchPage(data: widget.searchcontroller!.text));
                                          },
                                          style: TextStyle(
                                            fontSize: allsize * 0.015, // Adjust font size as needed
                                          ),
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            isDense: true, // Added for dense padding
                                            contentPadding: EdgeInsets.symmetric(
                                              vertical: allsize * 0.008, // Adjust vertical padding
                                              horizontal: allsize * 0.01, // Adjust horizontal padding
                                            ),
                                            prefixIcon: _showIcon
                                                ? Icon(
                                              Icons.search_outlined,
                                              size: allsize * 0.02,
                                            )
                                                : null,
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      color: Colors.white,
                                      width: size.width*0.1,
                                      height: allsize*0.034,
                                      child: Center(
                                        child:  _focusNode.hasFocus
                                            ? IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            provider.searchlist(false);
                                            widget.searchcontroller!.clear();
                                            provider.removesearchdata();
                                            provider
                                                .updatesearchselextion("");
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
