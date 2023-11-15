import 'package:flutter/cupertino.dart';
import 'package:midtowncomics/export.dart';

class CustomDialugue3 extends StatelessWidget {
  const CustomDialugue3({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Dialog(
        insetPadding: EdgeInsets.symmetric(
            horizontal: allsize * 0.012, vertical: allsize * 0.01),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
        child:
            Consumer<StreamedDataProvider>(builder: (context, provider, child) {
              String remaining="10";
              String totalNumber ="0";
          List<dynamic> pullListDataList = provider.pullListData['DATA'] == null
              ? []
              : provider.pullListData['DATA']['SubscribedPullList'];
              List<dynamic>regular= pullListDataList
                  .where((element) => element['su_count']== "1")
                  .toList();
          if(pullListDataList.isNotEmpty){
             totalNumber = pullListDataList.length.toString();
             remaining=(regular.length-10).toString();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.06,
                width: double.infinity,
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Pull list  $totalNumber",
                        style: TextStyle(fontSize: allsize * 0.011),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CupertinoIcons.clear,
                            color: Colors.black,
                            size: allsize * 0.02,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    regular.length>=10?"You are qualified for Pull List": 'Add $remaining more regular titles to complete your pull list',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: allsize * 0.011),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        regular.length.toString(),
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: allsize * 0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                        width: size.width * 0.5,
                        child:  LinearProgressIndicator(
                          value: regular.length / 10,
                          color: const Color(0xff006ccf),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: allsize * 0.011),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: ListView.builder(
                        itemCount: pullListDataList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.13,
                                        width: size.width * 0.15,
                                        child:Image.network(
                                          "https://www.midtowncomics.com/images/PRODUCT/FUL/${pullListDataList[index]['pr_id']}_ful.jpg",
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return const Center(
                                                  child:
                                                  CircularProgressIndicator());
                                            }
                                          },
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              pullListDataList[index]['pr_ttle'],
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: allsize * 0.01),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  final streamedDataProvider =
                                                  Provider.of<StreamedDataProvider>(context,
                                                      listen: false);

                                                  ApiRequests().SavePullList(streamedDataProvider.loginuserdata['sh_id'],pullListDataList[index]['su_id'],"1","1","", context);
                                                },
                                                child: Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      fontSize: allsize * 0.011,
                                                      color: Colors.black),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "QTY ${pullListDataList[index]['sd_qty']}",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: allsize * 0.011),
                                            ),
                                            // Text(
                                            //   "\$${pullListDataList[index]['sd_qty']}",
                                            //   style: TextStyle(
                                            //       fontSize: allsize * 0.011),
                                            // )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("What's a Pull List?"),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const BrowsePullList());
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: double.infinity,
                        color: const Color(0xff006ccf),
                        child: Center(
                          child: Text(
                            "VIEW PULL LIST",
                            style: TextStyle(
                                color: Colors.white, fontSize: allsize * 0.015),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }));
  }
}
