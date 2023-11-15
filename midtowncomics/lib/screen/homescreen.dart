
import 'package:midtowncomics/export.dart';

import '../widget/featurenewrelease.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller=TextEditingController();
  // ScrollController scrollController= ScrollController();
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
                    // provider.returnproduct.isEmpty?Container():
                    // SizedBox(height: size.height*0.02,),
                   provider.showsearchlist==true?
                    provider.returnproduct.isEmpty?Container():
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: provider.returnproduct.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                searchcontroller.text=provider.returnproduct[index]['pr_ttle'];
                              });
                              provider.updatesearchselextion(provider.returnproduct[index]['pr_ttle']);
                            },
                            child: Container(
                              color: index % 2 == 0
                                  ? const Color(0xffececec)
                                  : Colors.white,
                              child: Padding(
                                padding:EdgeInsets.all(allsize*0.005),
                                child: RichText(
                                  text: TextSpan(
                                  style: TextStyle(fontSize:allsize*0.012, color: Colors.black),
                            children: <TextSpan>[
                            TextSpan(text: "${provider.returnproduct[index]['pr_ttle']}-", style: const TextStyle(color: Color(0xff818181))),
                              TextSpan(text:provider.returnproduct[index]['cg_name'], style: const TextStyle(color: Color(0xff217fda))),
                            ],
                            ),
                            ),
                              ),
                            ),
                          );
                        }):Container(),
                    const HomeScreenBanner(),
                    const WeeklyReleaseButton(),
                    const Slider1(),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01),
                      child: const Slider2(),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const CardGridView(),
                    Consumer<StreamedDataProvider>(
                        builder: (context, provider, child) {
                      return
                      provider.Pagebannerlist1.isEmpty?const Center(child: CircularProgressIndicator()):
                        Slider3(
                        data: provider.Pagebannerlist1,
                      );
                    }),
                    Consumer<StreamedDataProvider>(
                        builder: (context, provider, child) {
                      return provider.Pagebannerlist2.isEmpty?const Center(child: CircularProgressIndicator(),): Slider3(
                        data:provider.Pagebannerlist2,
                      );
                    }),
                    Padding(
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
                                // controller: scrollController,
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount:
                                      (provider.featurenewrelease.length /
                                              2)
                                          .ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.featurenewrelease,
                                        context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.featurenewrelease
                                                    .length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.featurenewrelease
                                                    .length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .featurenewrelease[
                                                      index]['hideadultimage'],
                                                  pulllist: provider
                                                          .featurenewrelease[
                                                      index]['su_id'],
                                                  image: provider
                                                          .featurenewrelease[
                                                      index]['pr_id'],
                                                  title: provider
                                                          .featurenewrelease[
                                                      index]['pr_ttle'],
                                                  prce1: provider
                                                          .featurenewrelease[
                                                      index]['pr_price'],
                                                  price2: provider
                                                          .featurenewrelease[
                                                      index]['pr_lprice'],
                                                  preorder: provider
                                                          .featurenewrelease[
                                                      index]['pr_advord'],
                                                  quantity: int.parse(provider
                                                          .featurenewrelease[
                                                      index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .featurenewrelease[
                                                      index]['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .featurenewrelease[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(provider
                                                          .featurenewrelease[
                                                      index]['sc_qty']),
                                                  data: provider
                                                          .featurenewrelease[
                                                      index],
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
                                      itemCount:
                                          provider.crossoverlist.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (item, index) {
                                        return Row(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.08,
                                              width: size.width * 0.1,
                                              child: Image.network(
                                                provider.crossoverlist[
                                                    index]['img_url'],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
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
                                // controller: scrollController,
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount:
                                      (provider.recommendedforyou.length /
                                              2)
                                          .ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.recommendedforyou,
                                        context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.recommendedforyou
                                                    .length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.recommendedforyou
                                                    .length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .recommendedforyou[
                                                      index]['hideadultimage'],
                                                  pulllist: provider
                                                          .recommendedforyou[
                                                      index]['su_id'],
                                                  image: provider
                                                          .recommendedforyou[
                                                      index]['pr_id'],
                                                  title: provider
                                                          .recommendedforyou[
                                                      index]['pr_ttle'],
                                                  prce1: provider
                                                          .recommendedforyou[
                                                      index]['pr_price'],
                                                  price2: provider
                                                          .recommendedforyou[
                                                      index]['pr_lprice'],
                                                  preorder: provider
                                                          .recommendedforyou[
                                                      index]['pr_advord'],
                                                  quantity: int.parse(provider
                                                          .recommendedforyou[
                                                      index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .recommendedforyou[
                                                      index]['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .recommendedforyou[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(provider
                                                          .recommendedforyou[
                                                      index]['sc_qty']),
                                                  data: provider
                                                          .recommendedforyou[
                                                      index],
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
                    provider.Pagebanner3==""?const CircularProgressIndicator():
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          provider.Pagebanner3,
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
                                // controller: scrollController,
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount:
                                      (provider.recomendedpreorder.length /
                                              2)
                                          .ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.recomendedpreorder,
                                        context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.recomendedpreorder
                                                    .length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.recomendedpreorder
                                                    .length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .recomendedpreorder[
                                                      index]['hideadultimage'],
                                                  pulllist: provider
                                                          .recomendedpreorder[
                                                      index]['su_id'],
                                                  image: provider
                                                          .recomendedpreorder[
                                                      index]['pr_id'],
                                                  title: provider
                                                          .recomendedpreorder[
                                                      index]['pr_ttle'],
                                                  prce1: provider
                                                          .recomendedpreorder[
                                                      index]['pr_price'],
                                                  price2: provider
                                                          .recomendedpreorder[
                                                      index]['pr_lprice'],
                                                  preorder: provider
                                                          .recomendedpreorder[
                                                      index]['pr_advord'],
                                                  quantity: int.parse(provider
                                                          .recomendedpreorder[
                                                      index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .recomendedpreorder[
                                                      index]['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .recomendedpreorder[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(provider
                                                          .recomendedpreorder[
                                                      index]['sc_qty']),
                                                  data: provider
                                                          .recomendedpreorder[
                                                      index],
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
                                // controller: scrollController,
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount:
                                      (provider.recomendedbackissue.length /
                                              2)
                                          .ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.recomendedbackissue,
                                        context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.recomendedbackissue
                                                    .length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.recomendedbackissue
                                                    .length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .recomendedbackissue[
                                                      index]['hideadultimage'],
                                                  pulllist: provider
                                                          .recomendedbackissue[
                                                      index]['su_id'],
                                                  image: provider
                                                          .recomendedbackissue[
                                                      index]['pr_id'],
                                                  title: provider
                                                          .recomendedbackissue[
                                                      index]['pr_ttle'],
                                                  prce1: provider
                                                          .recomendedbackissue[
                                                      index]['pr_price'],
                                                  price2: provider
                                                          .recomendedbackissue[
                                                      index]['pr_lprice'],
                                                  preorder: provider
                                                          .recomendedbackissue[
                                                      index]['pr_advord'],
                                                  quantity: int.parse(provider
                                                          .recomendedbackissue[
                                                      index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .recomendedbackissue[
                                                      index]['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .recomendedbackissue[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(provider
                                                          .recomendedbackissue[
                                                      index]['sc_qty']),
                                                  data: provider
                                                          .recomendedbackissue[
                                                      index],
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
                                // controller: scrollController,
                                trackVisibility: true,
                                thumbVisibility: true,
                                child: PageView.builder(
                                  itemCount:
                                      (provider.bestSeller.length / 2)
                                          .ceil(),
                                  // Display two items per page
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.bestSeller, context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.bestSeller.length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.bestSeller.length)
                                              SizedBox(
                                                // width: size.width * 0.47962,
                                                // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .bestSeller[index]
                                                      ['hideadultimage'],
                                                  pulllist: provider
                                                          .bestSeller[index]
                                                      ['su_id'],
                                                  image: provider
                                                          .bestSeller[index]
                                                      ['pr_id'],
                                                  title: provider
                                                          .bestSeller[index]
                                                      ['pr_ttle'],
                                                  prce1: provider
                                                          .bestSeller[index]
                                                      ['pr_price'],
                                                  price2: provider
                                                          .bestSeller[index]
                                                      ['pr_lprice'],
                                                  preorder: provider
                                                          .bestSeller[index]
                                                      ['pr_advord'],
                                                  quantity: int.parse(
                                                      provider.bestSeller[
                                                          index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .bestSeller[index]
                                                      ['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .bestSeller[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(
                                                      provider.bestSeller[
                                                          index]['sc_qty']),
                                                  data: provider
                                                      .bestSeller[index],
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
                                  itemCount: (provider.exclusive.length / 2)
                                      .ceil(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, pageIndex) {
                                    FunctionClass().precacheImages(
                                        provider.exclusive, context);
                                    final startIndex = pageIndex * 2;
                                    final endIndex = startIndex + 2;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.013),
                                      child: Row(
                                        mainAxisAlignment: endIndex <=
                                                provider.exclusive.length
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.start,
                                        children: [
                                          for (var index = startIndex;
                                              index < endIndex;
                                              index++)
                                            if (index <
                                                provider.exclusive.length)
                                              SizedBox(
                                                // width: MediaQuery.of(context).size.width * 0.47962, // Adjust the width as needed
                                                child: FeatureNewRelease(
                                                  adultimage: provider
                                                          .exclusive[index]
                                                      ['hideadultimage'],
                                                  pulllist: provider
                                                          .exclusive[index]
                                                      ['su_id'],
                                                  image: provider
                                                          .exclusive[index]
                                                      ['pr_id'],
                                                  title: provider
                                                          .exclusive[index]
                                                      ['pr_ttle'],
                                                  prce1: provider
                                                          .exclusive[index]
                                                      ['pr_price'],
                                                  price2: provider
                                                          .exclusive[index]
                                                      ['pr_lprice'],
                                                  preorder: provider
                                                          .exclusive[index]
                                                      ['pr_advord'],
                                                  quantity: int.parse(
                                                      provider.exclusive[
                                                          index]['pr_qty']),
                                                  incart: int.parse(provider
                                                          .exclusive[index]
                                                      ['in_cart']),
                                                  productquantity:
                                                      int.parse(provider
                                                              .exclusive[
                                                          index]['pr_qty']),
                                                  qtycart: int.parse(
                                                      provider.exclusive[
                                                          index]['sc_qty']),
                                                  data: provider
                                                      .exclusive[index],
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
                    provider.Pagebanner4==""?const CircularProgressIndicator():
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          provider.Pagebanner4,
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
                          // width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    provider.Pagebanner5==""?const CircularProgressIndicator():
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          provider.Pagebanner5,
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
                          width: size.width, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    provider.Pagebanner6==""?const CircularProgressIndicator():
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: allsize * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          provider.Pagebanner6,
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
                searchcontroller:searchcontroller,
              )
            ],
          ));
        }));
  }
}
