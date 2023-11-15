
import 'package:midtowncomics/export.dart';

class ManageGiftCards extends StatefulWidget {
  const ManageGiftCards({super.key});

  @override
  State<ManageGiftCards> createState() => _ManageGiftCardsState();
}

class _ManageGiftCardsState extends State<ManageGiftCards> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
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
                        Text(
                          "Manage Gift Cards",
                          style: TextStyle(
                              fontFamily: 'oswald_bold',
                              fontSize:allsize*0.02, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(allsize*0.005),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text(
                            "Claim Gift Cards",
                            style: TextStyle(
                                color: const Color(0xff006ccf),
                                fontSize: allsize*0.016,
                                fontWeight: FontWeight.bold),
                          ),
                              Text(
                            "Gift Card #",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: allsize*0.013),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.5,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "123456 78901 23456",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500],fontSize: allsize*0.013)),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "PIN #",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500],fontSize: allsize*0.013)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: size.height*0.01,),
                          Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            color: const Color(0xff006ccf),
                            child:  Center(
                              child: Text(
                                "ADD GIFT CARD",
                                style: TextStyle(color: Colors.white, fontSize: allsize*0.017,fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Gift Card Balance",style: TextStyle(
                          color: const Color(0xff006ccf),
                          fontWeight: FontWeight.w400,
                          fontSize: allsize*0.018
                      ),)
                    ],),
                  ),
                ),
                const SubcribeWidget(),
                SizedBox(height: size.height*0.02,),
                const Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(ontap:() => scaffoldKey.currentState!.openDrawer(),)
          ],
        ),
      ),
    );
  }
}
