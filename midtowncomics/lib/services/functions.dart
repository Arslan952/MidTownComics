import 'package:flutter/cupertino.dart';

class FunctionClass{
  List<String> generateStringListFromInteger(int count) {
    List<String> stringList = ["-Remove-"];
    for (int i = 1; i <= count; i++) {
      stringList.add('$i in Cart');
    }
    return stringList;
  }
  int extractIntegerBeforeSpace(String text) {
    List<String> parts = text.split(" ");
    if (parts.isNotEmpty) {
      String value = parts.first;
      return int.tryParse(value) ??
          0; // Convert to int or default to 0 if not a valid integer.
    } else {
      return 0; // Default value if no space is found.
    }
  }
  String findoff(String price1,String price2) {
    double percent =
        ((double.parse(price1) - double.parse(price2)) /
            double.parse(price1)) *
            100;
    String stringValue = percent.toString();
    List<String> parts = stringValue.split('.');
    String partBeforeDecimal = parts[0];
    return partBeforeDecimal;
  }
  void precacheImages(List<dynamic> imageUrls,BuildContext context) {
    for (final imageUrl in imageUrls) {
      precacheImage(
          NetworkImage(
              "https://www.midtowncomics.com/images/PRODUCT/FUL/${imageUrl['pr_id']}_ful.jpg"),
          context);
    }
  }
  bool isListLengthEven(List<dynamic> myList) {
    return myList.length % 2 == 0;
  }

  String searchgradevalue(String prid,List<dynamic>data){
    String value="";
    for (var product in data) {
      if (product["pr_id"] == prid) {
       value=product['condition_name'];
        break; // Exit the loop once the product is found and updated
      }
    }
    return value;
  }
}