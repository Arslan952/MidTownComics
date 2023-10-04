import 'package:flutter/material.dart';
import 'package:midtowncomics/widget/textformfieldwidget.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class NewsLetterScreen extends StatefulWidget {
  const NewsLetterScreen({super.key});

  @override
  State<NewsLetterScreen> createState() => _NewsLetterScreenState();
}

class _NewsLetterScreenState extends State<NewsLetterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController l_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController c_email = TextEditingController();
  bool weeklynewsletter = false;
  bool dailydealsnewsletter = false;
  bool backissuenews = false;
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
                SizedBox(height: size.height * 0.166),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Subscribe to our newsletter!",
                      style:
                          TextStyle(fontSize: allsize*0.02, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                          title: "First Name",
                          textEditingController: name,
                          optional: true),
                      TextFormFieldWidget(
                          title: "Last Name",
                          textEditingController: name,
                          optional: true),
                      TextFormFieldWidget(
                          title: "Email Address",
                          textEditingController: name,
                          optional: true),
                      TextFormFieldWidget(
                          title: "Confirm Email Address",
                          textEditingController: name,
                          optional: true),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Midtown Comics Newsletter",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: allsize*0.015),
                        ),
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(unselectedWidgetColor: const Color(0xff006ccf)),
                              child: Checkbox(
                                activeColor: const Color(0xff006ccf),
                                value: weeklynewsletter,
                                onChanged: (newValue) {
                                  setState(() {
                                    weeklynewsletter = newValue!;
                                  });
                                },
                              ),
                            ),
                              Text("Weekly Newsletter",style: TextStyle(fontSize: allsize*0.011),)
                          ],
                        ),
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(unselectedWidgetColor: const Color(0xff006ccf)),
                              child: Checkbox(
                                value: dailydealsnewsletter,
                                onChanged: (newValue) {
                                  setState(() {
                                    dailydealsnewsletter = newValue!;
                                  });
                                },
                              ),
                            ),
                            Text("Daily Deals Newsletter",style: TextStyle(fontSize: allsize*0.011))
                          ],
                        ),
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(unselectedWidgetColor: const Color(0xff006ccf)),
                              child: Checkbox(
                                value: backissuenews,
                                onChanged: (newValue) {
                                  setState(() {
                                    backissuenews = newValue!;
                                  });
                                },
                              ),
                            ),
                            Text("Back Issues Newsletter",style: TextStyle(fontSize: allsize*0.011))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: double.infinity,
                          color: const Color(0xff006ccf),
                          child:  Center(
                            child: Text(
                              "SUBSCRIBE",
                              style: TextStyle(
                                  fontSize:allsize*0.016,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Weekly Newsletter",
                        style: TextStyle(
                            color: Colors.grey[600], fontWeight: FontWeight.bold,fontSize: allsize*0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Sign up for our weekly newsletter for special savings, creator events, industry news and so much more, including"
                        " the most accurate new release list available in the industry, one"
                        " full week in advance! This newsletter goes out every Wednesday afternoon, and highlights "
                        "all of the new books and products to be released the following Wednesday.",
                        style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Daily Deals",
                        style: TextStyle(
                            color: Colors.grey[600], fontWeight: FontWeight.bold,fontSize: allsize*0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Sign up to be notified DAILY of our hot Deal of the Day! Save up to 70% on great items related to the hottest trends!",
                        style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Back Issue Newsletter",
                        style: TextStyle(
                            color: Colors.grey[600], fontWeight: FontWeight.bold,fontSize: allsize*0.011),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "This newsletter is perfect for those who want to know what's "
                        "new with what's old! We add tons of back issues to our site EVERY DAY, and in the"
                        " Back Issues Newsletter we let you know what's hot, what's relevant, and maybe help you find an "
                        "undiscovered series "
                        "to love! This newsletter goes out every Friday.",
                        style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Information that you supply to us:We store all of the information that you enter on midtowncomics.com for the purposes of shipping, so that you don't have to re-enter the same data with each order,"
                        " and responding to all of your requests.\n\n"
                        "Sharing information:Midtowncomics.com does not share your information with any third parties.\n\n"
                        "E-Mail communications:From time to time we send out e-mails informing our customers of hot new releases.\n\n"
                        "Security:We protect our customers information by using SSL encryption provided by GoDaddy , which ensure the highest level of protection when transmitting data across the internet. Furthermore, our Website servers are protected behind hardware and software firewalls and tested on a regular basis using industry"
                        " standard Web scanners to keep our severs and site protected from any malicious activity.",
                        style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.011),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const SubcribeWidget(),
                SizedBox(height: size.height*0.02,),
                Footer(),
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
