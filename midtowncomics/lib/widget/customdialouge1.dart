import 'package:flutter/cupertino.dart';
import '../screen/faqscreen.dart';
import '../screen/mypreorderscreen.dart';
import '../screen/pulllistFAQscreen.dart';
import 'package:midtowncomics/export.dart';

class CustomDialugue1 extends StatelessWidget {
  const CustomDialugue1({super.key});

  @override
  Widget build(BuildContext context) {
    final streamedDataProvider =
    Provider.of<StreamedDataProvider>(context,
        listen: false);
    if(streamedDataProvider.loginuserdata.isNotEmpty)
      {
        ApiRequests().GetAccountSettings(streamedDataProvider.loginuserdata['sh_id'], context);
        ApiRequests().GetOrder(streamedDataProvider.loginuserdata['sh_id'], context);
      }
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return
      Consumer<StreamedDataProvider>(
        builder: (context, provider, child) {
          return Dialog(
              insetPadding:EdgeInsets.symmetric(horizontal:allsize*0.012,vertical: allsize*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.clear,
                        size: allsize * 0.02,
                      ),
                    ),
                  ),
                  provider.loginuserdata.isEmpty?
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(const SignInScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Container(
                        height: size.height * 0.06,
                        width: double.infinity,
                        color: const Color(0xff006ccf),
                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style:
                            TextStyle(color: Colors.white, fontSize: allsize * 0.013),
                          ),
                        ),
                      ),
                    ),
                  ):Center(child: Text("Hello, ${provider.loginuserdata['sh_fname']} ${provider.loginuserdata['sh_lname']}",
                  style: TextStyle(color: const Color(0xff196ebc),fontWeight:FontWeight.bold,fontSize: allsize*0.015 )),),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  provider.loginuserdata.isEmpty?
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: size.width*0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "New Customer?",
                          style: TextStyle(color: const Color(0xff8b8b8b), fontSize: allsize * 0.013),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationScreen()));
                              // Get.to(() =>const RegistrationScreen());
                            },
                            child: Text(
                              "CREATE AN ACCOUNT",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.012,
                                  fontWeight: FontWeight.w500
                              ),
                            ))
                      ],
                    ),
                  ):
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: size.width*0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Not You?",
                          style: TextStyle(color: const Color(0xff8b8b8b), fontSize: allsize * 0.013),
                        ),
                        InkWell(
                            onTap: () {
                            provider.removelogindata();
                            },
                            child: Text(
                              "LOGOUT",
                              style: TextStyle(
                                  color: const Color(0xff006ccf),
                                  fontSize: allsize * 0.012,
                                  fontWeight: FontWeight.w500
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MY ACCOUNT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: allsize * 0.013),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                          ontap: () {
                                if(provider.loginuserdata.isEmpty)
                                  {
                                    Navigator.pop(context);
                                    Get.to(const SignInScreen());
                                  }
                                else{
                                  Navigator.pop(context);
                                  Get.to(const MyAccountSetting());
                                }
                          },
                          title: "Account Setting",
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              if(provider.loginuserdata.isEmpty)
                              {
                                Navigator.pop(context);
                                Get.to(const SignInScreen());
                              }
                              else{
                                Navigator.pop(context);
                                Get.to(const MyOrderScreen());
                              }
                            },
                            title: "My Orders"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const MyWishListScreen());
                            },
                            title: "My Wish List"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const ManageGiftCards());
                            },
                            title: "Manage Gifts Card"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              if(provider.loginuserdata.isEmpty)
                              {
                                Navigator.pop(context);
                                Get.to(const SignInScreen());
                              }
                              else{
                                Navigator.pop(context);
                                Get.to(const AddressBookScreen());
                              }
                            },
                            title: "My Address Book"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              if(provider.loginuserdata.isEmpty)
                              {
                                Navigator.pop(context);
                                Get.to(const SignInScreen());
                              }
                              else{
                                Navigator.pop(context);
                                Get.to(const MyCreditCard());
                              }
                            },
                            title: "My Credit Card"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const NewsLetterScreen());
                            },
                            title: "My News Letter Setting"),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const PushNotificationSetting());
                            },
                            title: "Push Notification Setting"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MY PRE-ORDER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: allsize * 0.013),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const MyPreOrder());
                            },
                            title: "My Pre-Order Items"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const MyPreOrderScreen());
                            },
                            title: "My Pre-Orders"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(ontap: () {}, title: "Pre Order Catalogs"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const FaqSacreen());
                            },
                            title: "Pre Order FAQ"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MY PULL LIST",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: allsize * 0.013),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const MyPullList());
                            },
                            title: "My Pull list"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const BrowsePullList());
                            },
                            title: "Browse Pull List"),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        TextButtonWidget(
                            ontap: () {
                              Navigator.pop(context);
                              Get.to(const PullListFAQScreen());
                            },
                            title: "Pull List FAQ"),
                      ],
                    ),
                  ),
                ],
              ));
        });

  }
}
