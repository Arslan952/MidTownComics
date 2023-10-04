import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomDialugue3 extends StatelessWidget {
  const CustomDialugue3({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Dialog(
        insetPadding:EdgeInsets.symmetric(horizontal:allsize*0.012,vertical: allsize*0.01),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Column(
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
                    Text("Your Pull list  0",style: TextStyle(fontSize: allsize*0.011),),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          CupertinoIcons.clear,
                          color: Colors.black,
                          size: allsize*0.02,
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
              padding: EdgeInsets.all(8.0),
              child: AutoSizeText(
                  'Add 8 more regular titles to complete your pull list',style: TextStyle(color:Colors.grey[600],fontSize:allsize*0.011 ),
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
                      "2",
                      style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                    ),
                    SizedBox(
                      height: size.height*0.007,
                      width: size.width * 0.5,
                      child: const LinearProgressIndicator(
                        value: 2 / 10,
                        color: Color(0xff006ccf),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                     Text(
                      "10",
                      style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.64,
              child: Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.13,
                                      width: size.width * 0.15,
                                      child: Image.asset(
                                        'assets/images/dealoftheday.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.3,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                             Text(
                                            "Miles Morales Spider-Man Vol 2 # 10"
                                                "Cover a regular Dike Ruan Cover",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize:allsize*0.01),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(fontSize: allsize*0.011,color: Colors.black),
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.2,
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "QTY 1",
                                            style: TextStyle(color: Colors.grey,fontSize: allsize*0.011),
                                          ),
                                          Text("\$3.59",style: TextStyle(fontSize: allsize*0.011),)
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
                       child:TextButton(onPressed: () {  }, child:const Text("What's a Pull List?"),
                       ),
                     ),
                  Container(
                    height: size.height * 0.07,
                    width: double.infinity,
                    color: const Color(0xff006ccf),
                    child: Center(
                      child: Text(
                        "VIEW CART",
                        style: TextStyle(color: Colors.white, fontSize:allsize*0.015),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
