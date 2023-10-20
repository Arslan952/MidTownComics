import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  bool defaultshipping=true;
  bool defaultbilling=true;
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
                        child: Text(
                          "Address Book",
                          style: TextStyle(
                              fontSize: allsize*0.02, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(allsize*0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                Text("7 Zaman Park",style: TextStyle(
                                 color: const Color(0xff006ccf),fontWeight: FontWeight.bold,fontSize: allsize*0.0125
                               ),),
                               IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: allsize*0.02,))
                             ],),
                              Text("Arslan",style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0125),),
                              Text("7 Zaman Park",style: TextStyle(color: Colors.grey[600],fontSize:allsize*0.0125),),
                              Text("Lahore 5400",style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0125),),
                              Text("PAKISTAN",style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0125),),
                              SizedBox(height: size.height*0.005,),
                              Container(height: size.height*0.07,
                                width: double.infinity,
                                color: const Color(0xff006ccf),
                                child:  Center(
                                  child: Text("EDIT ADDRESS",style: TextStyle(color: Colors.white,fontSize:allsize*0.014,fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("DEFAULT SHIPPING",style: TextStyle(color: const Color(0xff006ccf),fontSize: allsize*0.011),),
                                  Switch(
                                      activeColor: const Color(0xff006ccf),
                                      value: defaultshipping, onChanged:(value)
                                  {
                                    setState(() {
                                      defaultshipping=value;
                                    });
                                  }),
                                  SizedBox(height: size.height*0.03,),
                                  Text("DEFAULT BILLING",style: TextStyle(color: const Color(0xff006ccf),fontSize:allsize*0.011),),
                                  Switch(
                                      activeColor: const Color(0xff006ccf),
                                      value: defaultbilling, onChanged:(value)
                                  {
                                    setState(() {
                                      defaultbilling=value;
                                    });
                                  })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height*0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff006ccf),width: 3)
                        ),
                        child: Center(
                          child: Text("ADD NEW ADDRESS",style: TextStyle(color: const Color(0xff006ccf),fontSize:allsize*0.016,fontWeight: FontWeight.bold ),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const SubcribeWidget(),
                    SizedBox(height: size.height*0.02,),
                    const Footer(),
                    SizedBox(
                      height: size.height * 0.05,
                    )
                  ],
                )),
            Header_Widget(ontap:() => scaffoldKey.currentState!.openDrawer(),

            )
          ],
        ),
      ),
    );
  }
}
