import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class MyWishListScreen extends StatefulWidget {
  const MyWishListScreen({super.key});

  @override
  State<MyWishListScreen> createState() => _MyWishListScreenState();
}

class _MyWishListScreenState extends State<MyWishListScreen> {
  TextEditingController searchcontroller = TextEditingController();
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
                SizedBox(height: size.height * 0.165),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xffd09102),
                          size: allsize * 0.025,
                        ),
                        Text(
                          "My Wish List",
                          style: TextStyle(
                              fontSize: allsize * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: size.height * 0.06,
                    child: TextFormField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIcon: Icon(
                            Icons.search,
                            size: allsize * 0.02,
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                              onPressed: () {
                                searchcontroller.clear();
                                FocusScope.of(context).unfocus();
                              },
                              icon: Icon(
                                CupertinoIcons.clear,
                                size: allsize * 0.02,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter By:",
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: allsize * 0.012),
                      ),
                      Container(
                        width: size.width * 0.3,
                        color: Colors.grey[200],
                        height: size.height * 0.035,
                      ),
                      Text("Sort By:",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: allsize * 0.012)),
                      Container(
                        width: size.width * 0.3,
                        color: Colors.grey[200],
                        height: size.height * 0.035,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.15,
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/mwishlist.jpg"),
                                    fit: BoxFit.fill)),
                            // child: Image.asset("assets/images/mwishlist.jpg",fit: BoxFit.fill,),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Oops.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: allsize * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "We couldn't find wish list\n product(s).",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: allsize * 0.011),
                              )
                            ],
                          )
                        ],
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
