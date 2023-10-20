// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:midtowncomics/provider/streamdataprovider.dart';
import 'package:provider/provider.dart';

import '../screen/homescreen.dart';

class ApiRequests {
  //Get All Data First Time
  Future<Map<String, dynamic>> fetchData() async {
    Map<String, dynamic> datai = {};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.midtowncomics.com/wcfmt/services/midtownprocess.svc/load-page-data-vr1?apiKey=ProductApiKey@8879kiop!&mtUser=AppUserMT@123!&mtPass=MTC007@8847!&sh_id=&pgn=home&rvl=1000,1002,1003&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(const HomeScreen());
      final data = await response.stream.bytesToString();
      datai = jsonDecode(data);
    } else {
      debugPrint(response.reasonPhrase.toString());
    }
    return datai;
  }

  //Get all data
  Future<Map<String, dynamic>> fetchData1(String sh1id) async {
    Map<String, dynamic> datai = {};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.midtowncomics.com/wcfmt/services/midtownprocess.svc/load-page-data-vr1?apiKey=ProductApiKey@8879kiop!&mtUser=AppUserMT@123!&mtPass=MTC007@8847!&sh_id=$sh1id&pgn=home&rvl=1000,1002,1003&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // streamedDataProvider.change(false);
      final data = await response.stream.bytesToString();
      datai = jsonDecode(data);
    } else {
      debugPrint(response.reasonPhrase.toString());
    }
    return datai;
  }

  //Load Cart Data
  Future<Map<String, dynamic>> loadcartdata(shid) async {
    Map<String, dynamic> datai = {};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.midtowncomics.com/wcfmt/services/cart.svc/load-by-shopper?apiKey=&mtUser=&mtPass=&sh_id=$shid&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();

      Map<String, dynamic> datache = jsonDecode(data);
      datai = datache;
    } else {
      debugPrint(response.reasonPhrase.toString());
    }
    return datai;
  }

  //Save To Cart
  Future<Map<String, dynamic>> Savedata(
      productid, quantity, BuildContext context) async {
    Map<String, dynamic> datai = {};
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    streamedDataProvider.change(true);
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.midtowncomics.com/wcfmt/services/cart.svc/save?apiKey=&mtUser=&mtPass=&sh_id=76367&pr_id=$productid&sc_qty=$quantity&app_id='));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      streamedDataProvider.change(false);
      final data = await response.stream.bytesToString();
      Map<String, dynamic> datache = jsonDecode(data);
      datai = datache;
    } else {
      debugPrint(response.reasonPhrase);
    }
    return datai;
  }

  //Product Detail Page
  Future<Map<String, dynamic>> ProductDetail(
      poductid, BuildContext context) async {
    Map<String, dynamic> datai = {};
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    streamedDataProvider.changedetailind(true);
    var request = http.Request(
        'GET',
        Uri.parse(
            "https://www.midtowncomics.com/wcfmt/services/product.svc/load-detail-by-parent-vr1?apiKey=&mtUser=&mtPass=&sh_id=76367&pr_id=$poductid&app_id="));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      streamedDataProvider.changedetailind(false);
      final data = await response.stream.bytesToString();
      Map<String, dynamic> datache = jsonDecode(data);
      datai = datache;
    } else {
      debugPrint(response.reasonPhrase);
    }
    return datai;
  }

  //Login Api
  Future<Map<String, dynamic>> LoginUser(
      String email, String password, BuildContext context) async {
    Map<String, dynamic> datai = {};
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    streamedDataProvider.change(true);
    var request = http.Request(
        'GET',
        Uri.parse(
            "https://www.midtowncomics.com/wcfmt/services/midtownprocess.svc/load-login?apiKey=&mtUser=&mtPass=&sh_lgid=$email&sh_pass=$password&app_id="));
    http.StreamedResponse response = await request.send();
    streamedDataProvider.change(false);
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      Map<String, dynamic> datache = jsonDecode(data);
      datai = datache;
      streamedDataProvider.updateLogingData(datache);

      Navigator.of(context).popUntil((route) => route.isFirst);
      // // Obtain shared preferences.
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
      debugPrint(datache.toString());
    } else {
      debugPrint(response.reasonPhrase.toString());
    }
    return datai;
  }

//Search Api
  Future<Map<String, dynamic>> SearchApi(
      String query,
      String categorie,
      String pp,
      String sb,
      outofstock,
      startdate,
      releaseyear,
      relatedttle,
      startdiscountvalue,
      enddiscountvalue,
      manufacturer,
      artist,
      writer,
      startprice,
      endprice,
      series,
      bool search,
      seriestitle,
      BuildContext context) async {
    debugPrint(pp.toString());
    Map<String, dynamic> datai = {};
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    streamedDataProvider.changesearchind(search == true ? false : true);
    streamedDataProvider.changebutton(true);
    var request = http.Request(
        'GET',
        Uri.parse(
            "https://www.midtowncomics.com/wcfmt/services/search.svc/load-search?apiKey=&mtUser=&mtPass=&sh_id=76367&q=$query&pp=$pp&pj=1&cat=$categorie&scat=&mn$manufacturer=&sp=$startprice&ep$endprice=&rel=&art$artist=&wrt$writer=&os=$outofstock&sb=$sb&sd=$startdate&ed=&sdisc$startdiscountvalue=&edisc$enddiscountvalue=&di$releaseyear=&si=$series&genre=&cfr=&nt$seriestitle=&rt$relatedttle=&clr=&ustmp=&prids=&pr_condition=&app_id="));
    http.StreamedResponse response = await request.send();
    streamedDataProvider.changesearchind(false);
    streamedDataProvider.changebutton(false);
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      Map<String, dynamic> datache = jsonDecode(data);
      datai = datache;
      streamedDataProvider.updatesearchdata(datache);
      // // Obtain shared preferences.
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
    } else {
      debugPrint(response.reasonPhrase);
    }
    return datai;
  }
}
