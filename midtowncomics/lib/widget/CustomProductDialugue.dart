// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:midtowncomics/services/apirequest.dart';
import 'package:midtowncomics/services/functions.dart';
import 'package:provider/provider.dart';

import '../provider/streamdataprovider.dart';
import '../screen/loginscreen.dart';

class CustomPrdoductDiallugue extends StatefulWidget {
  String productid;

  CustomPrdoductDiallugue({super.key, required this.productid});

  @override
  State<CustomPrdoductDiallugue> createState() =>
      _CustomPrdoductDiallugueState();
}

class _CustomPrdoductDiallugueState extends State<CustomPrdoductDiallugue> {
  bool change = false;
  String dropdownvalue = "1 in Cart";
  List<String> items = [];
  bool showDropdown = false;
  String image = "";

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

  Future<void> fetchData() async {
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    Map<String, dynamic> data =
        await ApiRequests().ProductDetail(widget.productid, context);
    streamedDataProvider.updateProductDetail(data);
    print(data);
  }

  void initState() {
    image = widget.productid;
    // TODO: implement initState
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Consumer<StreamedDataProvider>(builder: (context, provider, child) {
      return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: allsize * 0.012, vertical: allsize * 0.01),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Padding(
              padding: EdgeInsets.all(allsize * 0.01),
              child: provider.detailpageindicator == true ||
                      provider.detail.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<StreamedDataProvider>(
                      builder: (context, provider, child) {
                      // String? searchProductIdByCondition(
                      //     String condition) {
                      //   for (var product in provider.grades) {
                      //     if (product['condition_name'] ==
                      //         condition) {
                      //       return product['pr_id'];
                      //     }
                      //   }
                      //   return null; // Return null if no product with the specified condition name is found
                      // }
                      dropdownvalue = int.parse(provider.detail['sc_qty']) == 0
                          ? "1 in Cart"
                          : '${provider.detail['sc_qty']} in Cart';
                      if (int.parse(provider.detail['pr_qty']) > 25) {
                        items =
                            FunctionClass().generateStringListFromInteger(25);
                      } else {
                        items = FunctionClass().generateStringListFromInteger(
                            int.parse(provider.detail['pr_qty']));
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context, dropdownvalue);
                                // Navigator.pop(context, [
                                //   dropdownvalue,
                                //   showdialugue,
                                // ]);
                              },
                              icon: Icon(
                                CupertinoIcons.clear,
                                size: allsize * 0.02,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            height: size.height * 0.35,
                            child: Image.network(
                              "https://www.midtowncomics.com/images/PRODUCT/FUL/${image}_ful.jpg",
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            provider.detail['pr_ttle'],
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: allsize * 0.012,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("By:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child:
                                              Text(provider.detail['scg_name'],
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: allsize * 0.012,
                                                  )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Writer:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child:
                                              Text(provider.detail['pr_writ'],
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: allsize * 0.012,
                                                  )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Artist:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child: Text(
                                            provider.detail['pr_artst'],
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: allsize * 0.012,
                                            ),
                                            overflow: TextOverflow.clip,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Release Date:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child:
                                              Text(provider.detail['pr_reldt'],
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: allsize * 0.012,
                                                  )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("ISBN:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child: Text(
                                              provider.detail['isbn'] ?? '-',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: allsize * 0.012,
                                              )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Diamond Code:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: allsize * 0.012,
                                                fontWeight: FontWeight.w500)),
                                        Flexible(
                                          child: Text(
                                              provider.detail['pre_code'] ??
                                                  "-",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: allsize * 0.012,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: provider.detail['pr_lprice'] ==
                                    provider.detail['pr_price']
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$${provider.detail['pr_lprice']}",
                                style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: allsize * 0.0115),
                              ),
                              provider.detail['pr_lprice'] ==
                                      provider.detail['pr_price']
                                  ? Container()
                                  : Text(
                                      "\$${provider.detail['pr_price']}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: allsize * 0.0115),
                                    ),
                              provider.detail['pr_lprice'] ==
                                      provider.detail['pr_price']
                                  ? Container()
                                  : Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.2,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "${FunctionClass().findoff(provider.detail['pr_price'], provider.detail['pr_lprice'])}% OFF",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: allsize * 0.01,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          provider.detail['pr_is_backissue'] == "0"
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: allsize * 0.016,
                                              vertical: allsize * 0.04),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: provider.grades
                                                  .map<Widget>((dynamic item) {
                                                return ListTile(
                                                  title: Text(
                                                      item['condition_name']),
                                                  onTap: () async {
                                                    provider.setgroupvalue(
                                                        item['condition_name']);
                                                    widget.productid =
                                                        item['pr_id'];
                                                    provider
                                                        .updatedetailongrades({
                                                      "pr_id": item['pr_id'],
                                                      "pr_price":
                                                          item['pr_price'],
                                                      "pr_lprice":
                                                          item['pr_lprice'],
                                                      "pr_advord":
                                                          item['pr_advord'],
                                                      "pr_qty": item['pr_qty']
                                                    });
                                                    Navigator.of(context).pop();
                                                    // Map<String, dynamic>
                                                    // data =
                                                    // await ApiRequests().ProductDetail(widget.productid, context);
                                                    // provider.updateProductDetail(data);
                                                  },
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[300]),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          provider.groupvalue,
                                          style: TextStyle(
                                              fontSize: allsize * 0.014),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: allsize * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          if (provider.detail['in_cart'] == "0" || change)
                            change
                                ? const Center(
                                    child:
                                        CircularProgressIndicator(), // Show a circular progress indicator while loading
                                  ):
                            showDropdown
                                ?
                            InkWell(
                              onTap: () {
                                provider.loginuserdata.isEmpty?
                                Get.to(const SignInScreen()):
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      insetPadding: EdgeInsets.symmetric(
                                          horizontal: allsize * 0.016,
                                          vertical: allsize * 0.04),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                          items.map<Widget>((String item) {
                                            return ListTile(
                                              title: Text(item),
                                              onTap: () async {
                                                setState(() {
                                                  if (item == '-Remove-') {
                                                    showDropdown = false;
                                                    dropdownvalue = '1 in Cart';
                                                  }
                                                  dropdownvalue = item;
                                                });
                                                Navigator.of(context).pop();
                                                final streamedDataProvider =
                                                Provider.of<
                                                    StreamedDataProvider>(
                                                    context,
                                                    listen: false);
                                                int value1 =
                                                extractIntegerBeforeSpace(
                                                    item);
                                                // ApiRequests().Savedata(widget.productid,item == "-Remove-" ? "0" : value1.toString(), context);
                                                var request = http.Request(
                                                    'GET',
                                                    Uri.parse(
                                                        'https://www.midtowncomics.com/wcfmt/services/cart.svc/save?apiKey=&mtUser=&mtPass=&sh_id=76367&pr_id=${widget.productid}&sc_qty=${item == "-Remove-" ? "0" : value1.toString()}&app_id='));
                                                http.StreamedResponse response =
                                                await request.send();
                                                if (response.statusCode ==
                                                    200) {
                                                  final data = await response
                                                      .stream
                                                      .bytesToString();
                                                  streamedDataProvider
                                                      .updateCartData(
                                                      jsonDecode(data));
                                                  print(data);
                                                  Map<String, dynamic> datache =
                                                  jsonDecode(data);
                                                  print(datache['DATA']
                                                  ['cartList']);
                                                } else {
                                                  print(response.reasonPhrase);
                                                }
                                                provider.updatedetail(
                                                    item == "-Remove-"
                                                        ? "0"
                                                        : "1",
                                                    value1.toString());
                                                provider.call(
                                                    widget.productid,
                                                    item == "-Remove-"
                                                        ? "0"
                                                        : "1",
                                                    value1.toString());
                                                // Map<String, dynamic> data =
                                                //     await ApiRequests().Savedata(
                                                //         widget.image,
                                                //         item == "-Remove-"
                                                //             ? "0"
                                                //             : value1,
                                                //         context);
                                                // streamedDataProvider
                                                //     .updateCartData(data);
                                                // Map<String, dynamic> refresh =
                                                //     await ApiRequests()
                                                //         .fetchData1(context);
                                                // streamedDataProvider
                                                //     .updateData(refresh);
                                                // Close the dialog
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CustomDropDown(size: size, dropdownvalue: dropdownvalue, allsize: allsize),
                            )
                                : InkWell(
                                    onTap: () async {
                                      if(provider.loginuserdata.isEmpty)
                                        {
                                          Get.to(const SignInScreen());
                                        }
                                      else{
                                        provider.call(
                                            provider.detail['pr_id'], "1", "1");
                                        provider.updatedetail("1", "1");
                                        setState(() {
                                          change =
                                          true; // Set the loading flag to true
                                        });

                                        // Make your API request
                                        final streamedDataProvider =
                                        Provider.of<StreamedDataProvider>(
                                            context,
                                            listen: false);
                                        Map<String, dynamic> data =
                                        await ApiRequests().Savedata(
                                            provider.detail['pr_id'],
                                            1,
                                            context);

                                        setState(() {
                                          change =
                                          false; // Set the loading flag to false when the API request is done
                                          showDropdown =
                                          true; // Show the dropdown after the button is pressed
                                        });
                                        streamedDataProvider.updateCartData(data);
                                      }
                                    },
                                    child: ButtonWidget(
                                      quan: provider.detail['pr_qty'],
                                      preorder: provider.detail['pr_advord'],
                                    ),
                                  )
                          else
                            InkWell(
                              onTap: () {
                                provider.loginuserdata.isEmpty?
                                Get.to(const SignInScreen()):
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      insetPadding: EdgeInsets.symmetric(
                                          horizontal: allsize * 0.016,
                                          vertical: allsize * 0.04),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                              items.map<Widget>((String item) {
                                            return ListTile(
                                              title: Text(item),
                                              onTap: () async {
                                                setState(() {
                                                  if (item == '-Remove-') {
                                                    showDropdown = false;
                                                    dropdownvalue = '1 in Cart';
                                                  }
                                                  dropdownvalue = item;
                                                });
                                                Navigator.of(context).pop();
                                                final streamedDataProvider =
                                                    Provider.of<
                                                            StreamedDataProvider>(
                                                        context,
                                                        listen: false);
                                                int value1 =
                                                    extractIntegerBeforeSpace(
                                                        item);
                                                // ApiRequests().Savedata(widget.productid,item == "-Remove-" ? "0" : value1.toString(), context);
                                                var request = http.Request(
                                                    'GET',
                                                    Uri.parse(
                                                        'https://www.midtowncomics.com/wcfmt/services/cart.svc/save?apiKey=&mtUser=&mtPass=&sh_id=76367&pr_id=${widget.productid}&sc_qty=${item == "-Remove-" ? "0" : value1.toString()}&app_id='));
                                                http.StreamedResponse response =
                                                    await request.send();
                                                if (response.statusCode ==
                                                    200) {
                                                  final data = await response
                                                      .stream
                                                      .bytesToString();
                                                  streamedDataProvider
                                                      .updateCartData(
                                                          jsonDecode(data));
                                                  print(data);
                                                  Map<String, dynamic> datache =
                                                      jsonDecode(data);
                                                  print(datache['DATA']
                                                      ['cartList']);
                                                } else {
                                                  print(response.reasonPhrase);
                                                }
                                                provider.updatedetail(
                                                    item == "-Remove-"
                                                        ? "0"
                                                        : "1",
                                                    value1.toString());
                                                provider.call(
                                                    widget.productid,
                                                    item == "-Remove-"
                                                        ? "0"
                                                        : "1",
                                                    value1.toString());
                                                // Map<String, dynamic> data =
                                                //     await ApiRequests().Savedata(
                                                //         widget.image,
                                                //         item == "-Remove-"
                                                //             ? "0"
                                                //             : value1,
                                                //         context);
                                                // streamedDataProvider
                                                //     .updateCartData(data);
                                                // Map<String, dynamic> refresh =
                                                //     await ApiRequests()
                                                //         .fetchData1(context);
                                                // streamedDataProvider
                                                //     .updateData(refresh);
                                                // Close the dialog
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CustomDropDown(size: size, dropdownvalue: dropdownvalue, allsize: allsize),
                            ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          provider.detail['su_id'] == "0"
                              ? Container()
                              : Container(
                                  height: size.height * 0.06,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff006ccf),
                                          width: allsize * 0.003)),
                                  child: Center(
                                    child: Text(
                                      'ADD TO PULL LIST',
                                      style: TextStyle(
                                          color: Color(0xff006ccf),
                                          fontSize: allsize * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                        ],
                      );
                    })));
    });
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.size,
    required this.dropdownvalue,
    required this.allsize,
  });

  final Size size;
  final String dropdownvalue;
  final double allsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      // Set the desired width of the custom dropdown button
      decoration:
      BoxDecoration(color: Colors.grey[300]),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dropdownvalue,
            style:
            TextStyle(fontSize: allsize * 0.014),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: allsize * 0.02,
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  String preorder, quan;

  ButtonWidget({super.key, required this.quan, required this.preorder});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    int quantity = int.parse(widget.quan);
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Container(
      height: size.height * 0.06,
      color: (widget.preorder == "1")
          ? const Color(0xff9048c4)
          : (quantity == 0 || quantity < 0)
              ? Colors.red
              : const Color(0xff006ccf),
      child: Center(
          child: Text(
        widget.preorder == "1"
            ? "PRE-ORDER"
            : (quantity == 0 || quantity < 0)
                ? "ADD TO WISH LIST"
                : "ADD TO CART",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: allsize * 0.012),
      )),
    );
  }
}
