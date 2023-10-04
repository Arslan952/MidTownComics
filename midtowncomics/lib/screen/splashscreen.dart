import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<dynamic> data = [];

  Future<List<dynamic>> fetchData() async {
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.midtowncomics.com/wcfmt/services/midtownprocess.svc/load-page-data-vr1?apiKey=ProductApiKey@8879kiop!&mtUser=AppUserMT@123!&mtPass=MTC007@8847!&sh_id=76367&pgn=home&rvl=1000,1002,1003&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(const HomeScreen());
      final data = await response.stream.bytesToString();
      streamedDataProvider.updateData(jsonDecode(data));
    } else {
      print(response.reasonPhrase);
    }
    return data;
  }
  Future<void>cartdata()async{
    final streamedDataProvider =
    Provider.of<StreamedDataProvider>(context, listen: false);
    var request = http.Request('GET', Uri.parse('https://www.midtowncomics.com/wcfmt/services/cart.svc/load-by-shopper?apiKey=&mtUser=&mtPass=&sh_id=76367&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      print(data);
      streamedDataProvider.updateCartData(jsonDecode(data));
    }
    else {
      print(response.reasonPhrase);
    }
  }
  void initState() {
    fetchData();
    cartdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffd70306),
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen/splash_page.png'),
                fit: BoxFit.fill
              )
            ),
            child: Column(
        children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.3,
              ),
            ),
            SizedBox(
              height: size.height * 0.28,
            ),
            Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: allsize * 0.015, color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xff016fdf),
              ),
            )
        ],
      ),
          )),
    );
  }
}
