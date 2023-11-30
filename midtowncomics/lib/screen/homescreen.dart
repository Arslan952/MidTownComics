
import 'package:midtowncomics/export.dart';
import 'package:midtowncomics/widget/homeScrrenHorizantalListView.dart';
import 'package:midtowncomics/widget/homeSeriesCrossOver.dart';
import 'package:midtowncomics/widget/searchList.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller=TextEditingController();
  ScrollController featuredScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController recomendedScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController forYouScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController preOrderScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController backIssueScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController bestSellerScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  ScrollController exclusiveScrollController=ScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
  PageController featuredPageController=PageController();
  PageController recomendedPageController=PageController();
  PageController forYouPageController=PageController();
  PageController preOrderPageController=PageController();
  PageController backIssuePageController=PageController();
  PageController bestSellerPageController=PageController();
  PageController exclusivePageController=PageController();
  Future<void> cartdata() async {
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    Map<String, dynamic> data = await ApiRequests().loadcartdata(
        streamedDataProvider
                .loginuserdata
                .isEmpty
            ? ""
            :streamedDataProvider
                .loginuserdata['sh_id']);
    streamedDataProvider.updateCartData(data);
    Map<String,dynamic>data2=await ApiRequests().loadPullList(
        streamedDataProvider
            .loginuserdata
            .isEmpty
            ? ""
            : streamedDataProvider
            .loginuserdata['sh_id']);
    streamedDataProvider.updatePullListData(data2);
    ApiRequests().loadShippingInformation( streamedDataProvider.loginuserdata.isEmpty ? "" : streamedDataProvider.loginuserdata['sh_id']);
    ApiRequests().loadInStorePickUpInfo( streamedDataProvider.loginuserdata.isEmpty ? "" : streamedDataProvider.loginuserdata['sh_id']);
  }

  fetchdates()async{
     ApiRequests().GetDates(context);
  }
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      fetchdates();
      cartdata();
    });
    // TODO: implement initState
    super.initState();
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
          return SafeArea(
              child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.152),
                   //Search List
                   SearchList(searchcontroller: searchcontroller),
                    Column(
                      children: [
                        const HomeScreenBanner(),
                        //Weekly Release Button
                        const WeeklyReleaseButton(),
                        //Slider 01
                        const Slider1(),
                        Container(
                          color: Colors.white,
                          height: size.height * 0.05,
                        ),
                        //Slider 02
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          child: const Slider2(),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        //Grid View 01
                        const CardGridView(),
                        //Slider 03
                        Consumer<StreamedDataProvider>(
                            builder: (context, provider, child) {
                              return
                                provider.Pagebannerlist1.isEmpty?const Center(child: CircularProgressIndicator()):
                                Slider3(
                                  data: provider.Pagebannerlist1,
                                );
                            }),
                        //Slider 04
                        Consumer<StreamedDataProvider>(
                            builder: (context, provider, child) {
                              return provider.Pagebannerlist2.isEmpty?const Center(child: CircularProgressIndicator(),): Slider3(
                                data:provider.Pagebannerlist2,
                              );
                            }),
                        //Features New Release Section
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: size.height * 0.48,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color: const Color(0xffe0e0e0),
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
                                      child:HomeScrrenHorizantalList(data:provider.featurenewrelease, scrollController: featuredScrollController, pageScrollController: featuredPageController,)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Series Cross Over List
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
                                    child: HomeSeriesCrossOver(data: provider.crossoverlist,)
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Recommended FOr You
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: size.height * 0.48,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color:const Color(0xffe0e0e0),
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
                                    child:HomeScrrenHorizantalList(data: provider.recommendedforyou, scrollController:forYouScrollController, pageScrollController: forYouPageController,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Page Banner 3
                        provider.Pagebanner3.isEmpty?const CircularProgressIndicator():
                        InkWell(
                          onTap: (){
                            provider. updatesearchselextion(provider.Pagebanner3['target_page_parameters']['q']);
                            final streamedDataProvider =
                            Provider.of<StreamedDataProvider>(context, listen: false);
                            ApiRequests().SearchApi(streamedDataProvider.loginuserdata.isEmpty ? "" :streamedDataProvider.loginuserdata['sh_id'],provider.Pagebanner3['target_page_parameters']['q'],"","10","",provider.Pagebanner3['target_page_parameters']['os'],"","","","", "","", "", "", "", "","",false,"", context);
                            Get.to(const SearchPage());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                provider.Pagebanner3['image_url'],
                                // Use the 'image' field from your data
                                fit: BoxFit.fill,
                                width: size.width, // Adjust the width as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Recommended Pre Order
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: size.height * 0.48,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color: const Color(0xffe0e0e0),
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
                                      child:HomeScrrenHorizantalList(data: provider.recomendedpreorder, scrollController: preOrderScrollController, pageScrollController: preOrderPageController,)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Recommended Back Issue
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: size.height * 0.48,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color:const Color(0xffe0e0e0),
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
                                    child:HomeScrrenHorizantalList(data: provider.recomendedbackissue, scrollController: backIssueScrollController, pageScrollController: backIssuePageController,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Best Seller
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: size.height * 0.48,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color: const Color(0xffe0e0e0),
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
                                    child:HomeScrrenHorizantalList(data: provider.bestSeller, scrollController: bestSellerScrollController, pageScrollController: bestSellerPageController,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Exclusive
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: size.height * 0.5,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              return  ViewMoreCustomDialugue();
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color:const Color(0xffe0e0e0),
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
                                    child: HomeScrrenHorizantalList(data: provider.exclusive, scrollController: exclusiveScrollController, pageScrollController: exclusivePageController,),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //ridView 02
                        const CardGridView2(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Page Banner 04
                        provider.Pagebanner4.isEmpty?const CircularProgressIndicator():
                        InkWell(
                          onTap: (){
                            provider. updatesearchselextion(provider.Pagebanner4['target_page_parameters']['q']);
                            final streamedDataProvider =
                            Provider.of<StreamedDataProvider>(context, listen: false);
                            ApiRequests().SearchApi(streamedDataProvider.loginuserdata.isEmpty ? "" :streamedDataProvider.loginuserdata['sh_id'],provider.Pagebanner4['target_page_parameters']['q'],"","10","","","","","","", "","", "", "", "", "","",false,"", context);
                            Get.to(const SearchPage());
                          },
                          child: Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: allsize * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                provider.Pagebanner4['image_url'],
                                // Use the 'image' field from your data
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, exception, stackTrace) {
                                  return Image.asset('assets/images/imagecomingsoon_ful.jpg',fit: BoxFit.cover,);
                                },
                                // width: size.width, // Adjust the width as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Page Banner 05
                        provider.Pagebanner5.isEmpty?const CircularProgressIndicator():
                        InkWell(
                          onTap: (){
                            provider. updatesearchselextion(provider.Pagebanner5['target_page_parameters']['q']);
                            final streamedDataProvider =
                            Provider.of<StreamedDataProvider>(context, listen: false);
                            ApiRequests().SearchApi(streamedDataProvider.loginuserdata.isEmpty ? "" :streamedDataProvider.loginuserdata['sh_id'],provider.Pagebanner5['target_page_parameters']['q'],"","10","","","","","","", "","", "", "", "", "","",false,"", context);
                            Get.to(const SearchPage());
                          },
                          child: Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: allsize * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                provider.Pagebanner5['image_url'],
                                // Use the 'image' field from your data
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, exception, stackTrace) {
                                  return Image.asset('assets/images/imagecomingsoon_ful.jpg',fit: BoxFit.cover,);
                                },

                                width: size.width, // Adjust the width as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //Page Banner 06
                        provider.Pagebanner6.isEmpty?const CircularProgressIndicator():
                        InkWell(
                          onTap: ()async{
                            if (!await launchUrl(Uri.parse(provider.Pagebanner6['external_url']))) {
                            throw Exception('Could not launch ${Uri.parse(provider.Pagebanner6['external_url']
                            )}');
                            }
                          },
                          child: Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: allsize * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                provider.Pagebanner6['image_url'],
                                // Use the 'image' field from your data
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, exception, stackTrace) {
                                  return Image.asset('assets/images/imagecomingsoon_ful.jpg',fit: BoxFit.cover,);
                                },
                                width: size.width, // Adjust the width as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        //News Letter Subcribe Widget
                        const SubcribeWidget(),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //Footer Widget
                        const Footer(),
                        SizedBox(
                          height: size.height * 0.05,
                        )
                      ],
                    )
                    //Home Screen Banner

                  ],
                ),
              ),
              //Header Widget
              Header_Widget(
                ontap: () => scaffoldKey.currentState!.openDrawer(),
                searchcontroller:searchcontroller,
              )
            ],
          ));
        }));
  }
}
