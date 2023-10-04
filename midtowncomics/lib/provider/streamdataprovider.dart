import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

class StreamedDataProvider extends ChangeNotifier {

  //Search Dropdown
  String title="All";
  changetitle(String titl){
    title=titl;
    notifyListeners();
  }


  //Home Screen Api
  Map<String,dynamic> _streamedData ={};
  Map<String,dynamic> get streamedData => _streamedData;
  void updateData(Map<String,dynamic> data) {
    _streamedData = data;
    notifyListeners();
  }


  //Cart Api
  Map<String,dynamic> _cartstream ={};
  Map<String,dynamic> get cartdata => _cartstream;
  void updateCartData(Map<String,dynamic> data) {
    _streamedData = data;
    notifyListeners();
  }
}
