import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:midtowncomics/services/apirequest.dart';
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

  Future<void> fetchData() async {
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    Map<String,dynamic>data=await ApiRequests().fetchData();
      streamedDataProvider.updateData(data);
  }

  void initState() {
    fetchData();
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
