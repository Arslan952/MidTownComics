import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:midtowncomics/screen/account_setting.dart';
import 'package:midtowncomics/screen/all_faq_screen.dart';
import 'package:midtowncomics/screen/browsepulllist.dart';
import 'package:midtowncomics/screen/contct_information_screen.dart';
import 'package:midtowncomics/screen/faqscreen.dart';
import 'package:midtowncomics/screen/instore_picup_screen.dart';
import 'package:midtowncomics/screen/managegiftcardscreen.dart';
import 'package:midtowncomics/screen/newsletterscreen.dart';
import 'package:midtowncomics/screen/privacypolicy.dart';
import 'package:midtowncomics/screen/shippingFaq.dart';

import '../screen/myorderscreen.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          //About Us
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              title: Text(
                "ABOUT US",
                style: TextStyle(
                    color: const Color(0xff006ccf), fontSize: allsize * 0.0113),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  // isExpanded = value;
                });
              },
              children: [
                ListTile(
                  title: Text(
                    "CONTACT INFORMATION",
                    style: TextStyle(fontSize: allsize * 0.0113),
                  ),
                  onTap: () {
                    Get.to(const ContactInformationScreen());
                  },
                ),
                ListTile(
                  title: Text("CUSTOMER TESTIMONIAL",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("SIGNING & EVENT",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                )
              ],
            ),
          ),
          //OUR Stories
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              title: Text(
                "OUR STORIES",
                style: TextStyle(
                    color: Color(0xff006ccf), fontSize: allsize * 0.0113),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  // isExpanded = value;
                });
              },
              children: <Widget>[
                ListTile(
                  title: Text("DOWNTOWN",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("GRAND CENTRAL",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("TIMES SQUARE",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("ASTORIA OUTLET",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                )
              ],
            ),
          ),
          //Community
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              title: Text(
                "COMMUNITY",
                style: TextStyle(
                    color: Color(0xff006ccf), fontSize: allsize * 0.0113),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  // isExpanded = value;
                });
              },
              children: <Widget>[
                ListTile(
                  title: Text("BLOG",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("FACEBOOK",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("INSTAGRAM",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("TUMBLR",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("TWITTER",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("YOUTUBE",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                )
              ],
            ),
          ),
          //My Accounts
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              title: Text(
                "MY ACCOUNT",
                style: TextStyle(
                    color: Color(0xff006ccf), fontSize: allsize * 0.0113),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  // isExpanded = value;
                });
              },
              children: <Widget>[
                ListTile(
                  title: Text("ORDER STATUS",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const MyOrderScreen());
                  },
                ),
                ListTile(
                  title: Text("ACCOUNT SETTINGS",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const MyAccountSetting());
                  },
                ),
                ListTile(
                  title: Text("SUBSCRIPTION SETTINGS",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const NewsLetterScreen());
                  },
                ),
                ListTile(
                  title: Text("CHECK GIFT CARD BALANCE",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const ManageGiftCards());
                  },
                ),
                ListTile(
                  title: Text("PULL LIST FAQ",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const FaqSacreen());
                  },
                ),
                ListTile(
                  title: Text("PULL LIST",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const BrowsePullList());
                  },
                ),
                ListTile(
                  title: Text("PREVIEWS FAQ",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("PREVIEWS",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                )
              ],
            ),
          ),
          //Customer Service
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              title: Text(
                "CUSTOMER SERVICE",
                style: TextStyle(
                    color: const Color(0xff006ccf), fontSize: allsize * 0.0113),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  // isExpanded = value;
                });
              },
              children: <Widget>[
                ListTile(
                  title: Text("IN-STORE PICK-UP",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const InStorePickupScreen());
                  },
                ),
                ListTile(
                  title: Text("SITEMAP",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title:
                      Text("FAQ", style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.off(const AllFaqScreen());
                  },
                ),
                ListTile(
                  title: Text("PRIVACY POLICY",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const PrivacyPolicy());
                  },
                ),
                ListTile(
                  title: Text("UNSUBSCRIBE NEWSLETTER",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const NewsLetterScreen());
                  },
                ),
                ListTile(
                  title: Text("TERMS & CONDITIONS",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("SHIPPING INFORMATION",
                      style: TextStyle(fontSize: allsize * 0.0113)),
                  onTap: () {
                    Get.to(const ShippingFaqScreen());
                  },
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){},
                  child: Image.asset('assets/images/icon/facebook_50.png',height: allsize*0.025,width: allsize*0.025,)),              // IconButton(
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.black, size: allsize * 0.02)),
              InkWell(
                  onTap: (){},
                  child: Image.asset('assets/images/icon/youtube_50.png',height: allsize*0.025,width: allsize*0.025,)),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.black, size: allsize * 0.02)),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "All Site Content and 2018 Midtown Comics, unless otherwise noted All Right Reserved",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: const Color(0xff006ccf), fontSize: allsize * 0.01),
          )
        ],
      ),
    );
  }
}
