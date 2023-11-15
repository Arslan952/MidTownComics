// ignore_for_file: must_be_immutable

import 'package:midtowncomics/widget/weeklyreleaselistview.dart';
import 'package:midtowncomics/export.dart';

class PreOrderScreen extends StatefulWidget {
  const PreOrderScreen({super.key});

  @override
  State<PreOrderScreen> createState() => _PreOrderScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _PreOrderScreenState extends State<PreOrderScreen> {
  int index = 1;
  TextEditingController searchcontroller = TextEditingController();

  Future<bool> _onWillPop() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: scaffoldKey,
          drawer: const Custom_drawer(),
          backgroundColor: const Color(0xfff6f6f6),
          body: Consumer<StreamedDataProvider>(
              builder: (context, provider, child) {
                return Stack(
                  children: [
                    SafeArea(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: provider.searchpagein == true
                                  ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.19),
                                  const Center(
                                      child: CircularProgressIndicator()),
                                ],
                              )
                                  : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.153),
                                  provider.returnproduct.isEmpty
                                      ? Container()
                                      : SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  provider.showsearchlist == true
                                      ? provider.returnproduct.isEmpty
                                      ? Container()
                                      : ListView.builder(
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                      provider.returnproduct.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              searchcontroller.text =
                                              provider.returnproduct[
                                              index]['pr_ttle'];
                                            });
                                            provider.updatesearchselextion(
                                                provider.returnproduct[
                                                index]['pr_ttle']);
                                          },
                                          child: Container(
                                            color: index % 2 == 0
                                                ? const Color(0xffececec)
                                                : Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  allsize * 0.005),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                      fontSize:
                                                      allsize * 0.012,
                                                      color:
                                                      Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                        "${provider.returnproduct[index]['pr_ttle']}-",
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff818181))),
                                                    TextSpan(
                                                        text: provider
                                                            .returnproduct[
                                                        index]
                                                        ['cg_name'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff217fda))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                      : Container(),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 0.2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      height: size.height * 0.06,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            //SORT BY
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const SortByDialaugue();
                                                  },
                                                );
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "SORT BY",
                                                    style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize:
                                                        allsize * 0.013),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.01,
                                                  ),
                                                  Icon(
                                                    Icons.sort,
                                                    color: Colors.blueAccent,
                                                    size: allsize * 0.02,
                                                  )
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const FilterDialaugue();
                                                  },
                                                );
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "FILTERS",
                                                    style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize:
                                                        allsize * 0.013),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.015,
                                                  ),
                                                  Image.asset(
                                                      'assets/images/icon/filter.PNG',
                                                      height: size.height * 0.022)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      "NOW SHOWING 355 NEW RELEASE ITEMS",
                                      style: TextStyle(
                                          color: const Color(0xff868686),
                                          fontSize: allsize * 0.012),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.012,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.025),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PREVIEWS FOR",
                                          style: TextStyle(
                                              fontSize: allsize * 0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300]),
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Oct 25,2023",
                                                style: TextStyle(
                                                    fontSize: allsize * 0.014),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                size: allsize * 0.02,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.025),
                                    child: Container(
                                      color: const Color(0xffe4e4e4),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                index=1;
                                              });
                                            },
                                            child: Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.234,
                                              color: Color(index == 1
                                                  ? (0xff006ccf)
                                                  : 0xffe4e4e4),
                                              child: Center(
                                                  child: Text(
                                                    "COMICS &\nGRAPHIC\nNOVELS",
                                                    style: TextStyle(
                                                        color: index == 1
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: allsize * 0.013),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                index=2;
                                              });
                                            },
                                            child: Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.234,
                                              color: Color(index == 2
                                                  ? (0xff006ccf)
                                                  : 0xffe4e4e4),
                                              child: Center(
                                                  child: Text(
                                                    "INDIES,\nBOOKS\nMAGAZINES",
                                                    style: TextStyle(
                                                        color: index == 2
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: allsize * 0.013),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                index=3;
                                              });
                                            },
                                            child: Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.234,
                                              color: Color(index == 3
                                                  ? (0xff006ccf)
                                                  : 0xffe4e4e4),
                                              child: Center(
                                                  child: Text(
                                                    "APPAREL",
                                                    style: TextStyle(
                                                        color: index == 3
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: allsize * 0.013),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                index=4;
                                              });
                                            },
                                            child: Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.234,
                                              color: Color(index == 4
                                                  ? (0xff006ccf)
                                                  : 0xffe4e4e4),
                                              child: Center(
                                                  child: Text(
                                                    "MERCHANDISE & MORE",
                                                    style: TextStyle(
                                                        color: index == 4
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: allsize * 0.013),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height*0.01,),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                                    child: Container(
                                      height: size.height*0.07,
                                      width: double.infinity,
                                      color: const Color(0xff006ccf),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height*0.022,
                                            bottom: size.height*0.022,
                                            left: size.width*0.025
                                        ),
                                        child: Text(index==1?"COMICS & GRAPHIC NOVELS":index==2?"INDIES,BOOKS,MAGAZINES":"MERCHANDISE,APPAREL & MORE",style:TextStyle(
                                            color: Colors.white,fontSize: allsize*0.015
                                        ),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height*0.01,),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width*0.028),
                                    child: Text("Dark Horse",style: TextStyle(color: const Color(0xff767676),fontSize: allsize*0.015,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(height: size.height*0.01,),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: 5,
                                      itemBuilder: (context,index)
                                      {
                                        return WeeklyRelaseListView(index: index,);
                                      }
                                  ),
                                  SizedBox(height: size.height*0.01,),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(3.0),
                                    child: Container(
                                      height: size.height * 0.06,
                                      color: const Color(0xff006ccf),
                                      child: Center(
                                        child: Text(
                                          "LOAD MORE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                              allsize * 0.013),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height*0.01,)
                                ],
                              ),
                            ),
                            Header_Widget(
                              ontap: () => scaffoldKey.currentState!.openDrawer(),
                              searchcontroller: searchcontroller,
                            )
                          ],
                        )),
                  ],
                );
              })),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); // Start from the top-left corner
    path.lineTo(size.width * 0.9, size.height); // Go to the bottom-right corner
    path.lineTo(size.width, 0); // Go to the top-right corner
    path.lineTo(0, 0); // Go back to the top-left corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.size,
    required this.dropdownValue,
    required this.allsize,
  });

  final Size size;
  final String dropdownValue;
  final double allsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      decoration: BoxDecoration(color: Colors.grey[300]),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dropdownValue,
            style: TextStyle(fontSize: allsize * 0.014),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: allsize * 0.02,
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  String preorder, quan;

  ButtonWidget({super.key, required this.quan, required this.preorder});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    int quantity = int.parse(widget.quan);
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Container(
      height: size.height * 0.06,
      color: (widget.preorder == "1")
          ? const Color(0xff9048c4)
          : (quantity == 0 || quantity < 0)
          ? Colors.red
          : const Color(0xff006ccf),
      child: Center(
          child: Text(
            widget.preorder == "1"
                ? "PRE-ORDER"
                : (quantity == 0 || quantity < 0)
                ? "ADD TO WISH LIST"
                : "ADD TO CART",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: allsize * 0.012),
          )),
    );
  }
}
