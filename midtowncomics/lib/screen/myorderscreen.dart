import 'package:midtowncomics/export.dart';
import 'package:midtowncomics/provider/orderprovider.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool active = true;
  bool inactive = false;
  TextEditingController searchcontroller=TextEditingController();
  Color getColor(Set<MaterialState> states) {
    return const Color(0xffececec);
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: const Custom_drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(child:
                Consumer<OrderProvider>(builder: (context,order, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.165),
                  Consumer<StreamedDataProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            provider.showsearchlist == true
                                ? provider.returnproduct.isEmpty
                                ? Container()
                                : ListView.builder(
                                physics:
                                const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                provider.returnproduct.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        searchcontroller
                                            .text = provider
                                            .returnproduct[index]
                                        ['pr_ttle'];
                                      });
                                      provider.updatesearchselextion(
                                          provider.returnproduct[
                                          index]['pr_ttle']);
                                    },
                                    child: Container(
                                      color: index % 2 == 0
                                          ? const Color(0xffececec)
                                          : Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            allsize * 0.005),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize:
                                                allsize * 0.012,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                  "${provider.returnproduct[index]['pr_ttle']}-",
                                                  style: const TextStyle(
                                                      color: Color(
                                                          0xff818181))),
                                              TextSpan(
                                                  text:
                                                  provider.returnproduct[
                                                  index]
                                                  ['cg_name'],
                                                  style: const TextStyle(
                                                      color: Color(
                                                          0xff217fda))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                : Container(),
                          ],
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My Orders",
                      style: TextStyle(
                        fontFamily: 'oswald_bold',
                        fontSize: allsize * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //Order In Process
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Orders in Process",
                                style: TextStyle(
                                    color: const Color(0xff006ccf),
                                    fontSize: allsize * 0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.025),
                                child: Theme(
                                  data: Theme.of(
                                      context)
                                      .copyWith(
                                      dividerColor:
                                      Colors
                                          .transparent),
                                  child: SizedBox(
                                    width: size.width*1,
                                    child: DataTable(
                                      headingRowColor:
                                      MaterialStateProperty
                                          .resolveWith(
                                          getColor),
                                      headingRowHeight:
                                      size.height *
                                          0.025,
                                      horizontalMargin:
                                      0,
                                      // columnSpacing:size.width*0.06,
                                      // Add column spacing for better visibility
                                      dataRowHeight:
                                      size.height *
                                          0.025,
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Date',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), // Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Order#',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Total',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                          order.inProcessOrder.length,
                                              (index) {
                                            final item =
                                            order.inProcessOrder[
                                            index];
                                            return DataRow(
                                              // color: index %
                                              //     2 ==
                                              //     0
                                              //     ? null
                                              //     : MaterialStateProperty
                                              //     .resolveWith(
                                              //     getColor),
                                              cells: [
                                                DataCell(
                                                    StreamBuilder<Object>(
                                                        stream: null,
                                                        builder: (context, snapshot) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                item[
                                                                'od_stmp'],
                                                                style:
                                                                TextStyle(fontSize: allsize * 0.012),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "${item['od_id']}",
                                                      style: TextStyle(
                                                          color: const Color(0xff006ccf),
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "\$${item['total']}",
                                                      style: TextStyle(
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Order Process
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Orders Process / Shipped and Completed",
                                style: TextStyle(
                                    color: const Color(0xff006ccf),
                                    fontSize: allsize * 0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.025),
                                child: Theme(
                                  data: Theme.of(
                                      context)
                                      .copyWith(
                                      dividerColor:
                                      Colors
                                          .transparent),
                                  child: SizedBox(
                                    width: size.width*1,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: DataTable(
                                        headingRowColor:
                                        MaterialStateProperty
                                            .resolveWith(
                                            getColor),
                                        headingRowHeight:
                                        size.height *
                                            0.032,
                                        horizontalMargin:
                                        0,
                                        // columnSpacing:size.width*0.06,
                                        // Add column spacing for better visibility
                                        dataRowHeight:
                                        size.height *
                                            0.032,
                                        columns: <DataColumn>[
                                          DataColumn(
                                            label: Text(
                                              'Date',
                                              style: TextStyle(
                                                  color: Colors.grey[
                                                  700],
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize:
                                                  allsize *
                                                      0.014), // Set text color for the heading
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Order#',
                                              style: TextStyle(
                                                  color: Colors.grey[
                                                  700],
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize:
                                                  allsize *
                                                      0.014), //// Set text color for the heading
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Total',
                                              style: TextStyle(
                                                  color: Colors.grey[
                                                  700],
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize:
                                                  allsize *
                                                      0.014), //// Set text color for the heading
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Tracking',
                                              style: TextStyle(
                                                  color: Colors.grey[
                                                  700],
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize:
                                                  allsize *
                                                      0.014), //// Set text color for the heading
                                            ),
                                          ),
                                        ],
                                        rows: List.generate(
                                            order.shippedOrder.length,
                                                (index) {
                                              final item =
                                              order.shippedOrder[
                                              index];
                                              return DataRow(
                                                // color: index %
                                                //     2 ==
                                                //     0
                                                //     ? null
                                                //     : MaterialStateProperty
                                                //     .resolveWith(
                                                //     getColor),
                                                cells: [
                                                  DataCell(
                                                      StreamBuilder<Object>(
                                                          stream: null,
                                                          builder: (context, snapshot) {
                                                            return Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  item[
                                                                  'od_stmp'],
                                                                  style:
                                                                  TextStyle(fontSize: allsize * 0.014),
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                      )),
                                                  DataCell(
                                                      Text(
                                                        "${item['od_id']}",
                                                        style: TextStyle(
                                                            color: const Color(0xff006ccf),
                                                            fontSize:
                                                            allsize * 0.014),
                                                      )),
                                                  DataCell(
                                                      Text(
                                                        "\$${item['total']}",
                                                        style: TextStyle(
                                                            fontSize:
                                                            allsize * 0.014),
                                                      )),
                                                  DataCell(
                                                      Text(
                                                        item['od_track'],
                                                        style: TextStyle(
                                                            fontSize:
                                                            allsize * 0.014),
                                                      )),
                                                ],
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Order Declined
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Orders Declined",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: allsize * 0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.025),
                                child: Theme(
                                  data: Theme.of(
                                      context)
                                      .copyWith(
                                      dividerColor:
                                      Colors
                                          .transparent),
                                  child: SizedBox(
                                    width: size.width*1,
                                    child: DataTable(
                                      headingRowColor:
                                      MaterialStateProperty
                                          .resolveWith(
                                          getColor),
                                      headingRowHeight:
                                      size.height *
                                          0.025,
                                      horizontalMargin:
                                      0,
                                      // columnSpacing:size.width*0.06,
                                      // Add column spacing for better visibility
                                      dataRowHeight:
                                      size.height *
                                          0.025,
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Date',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), // Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Order#',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Total',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                          order.declinedOrder.length,
                                              (index) {
                                            final item =
                                            order.declinedOrder[
                                            index];
                                            return DataRow(
                                              // color: index %
                                              //     2 ==
                                              //     0
                                              //     ? null
                                              //     : MaterialStateProperty
                                              //     .resolveWith(
                                              //     getColor),
                                              cells: [
                                                DataCell(
                                                    StreamBuilder<Object>(
                                                        stream: null,
                                                        builder: (context, snapshot) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                item[
                                                                'od_stmp'],
                                                                style:
                                                                TextStyle(fontSize: allsize * 0.012),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "${item['od_id']}",
                                                      style: TextStyle(
                                                          color: const Color(0xff006ccf),
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "\$${item['total']}",
                                                      style: TextStyle(
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Order Cancelled
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Orders Cancelled",
                                style: TextStyle(
                                    color: const Color(0xff006ccf),
                                    fontSize: allsize * 0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.025),
                                child: Theme(
                                  data: Theme.of(
                                      context)
                                      .copyWith(
                                      dividerColor:
                                      Colors
                                          .transparent),
                                  child: SizedBox(
                                    width: size.width*1,
                                    child: DataTable(
                                      headingRowColor:
                                      MaterialStateProperty
                                          .resolveWith(
                                          getColor),
                                      headingRowHeight:
                                      size.height *
                                          0.025,
                                      horizontalMargin:
                                      0,
                                      // columnSpacing:size.width*0.06,
                                      // Add column spacing for better visibility
                                      dataRowHeight:
                                      size.height *
                                          0.025,
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Date',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), // Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Order#',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Total',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                          order.CancelOrder.length,
                                              (index) {
                                            final item =
                                            order.CancelOrder[
                                            index];
                                            return DataRow(
                                              // color: index %
                                              //     2 ==
                                              //     0
                                              //     ? null
                                              //     : MaterialStateProperty
                                              //     .resolveWith(
                                              //     getColor),
                                              cells: [
                                                DataCell(
                                                    StreamBuilder<Object>(
                                                        stream: null,
                                                        builder: (context, snapshot) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                item[
                                                                'od_stmp'],
                                                                style:
                                                                TextStyle(fontSize: allsize * 0.012),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "${item['od_id']}",
                                                      style: TextStyle(
                                                          color: const Color(0xff006ccf),
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "\$${item['total']}",
                                                      style: TextStyle(
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Arcieve Orders
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Archive Orders",
                                style: TextStyle(
                                    color: const Color(0xff006ccf),
                                    fontSize: allsize * 0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.025),
                                child: Theme(
                                  data: Theme.of(
                                      context)
                                      .copyWith(
                                      dividerColor:
                                      Colors
                                          .transparent),
                                  child: SizedBox(
                                    width: size.width*1,
                                    child: DataTable(
                                      headingRowColor:
                                      MaterialStateProperty
                                          .resolveWith(
                                          getColor),
                                      headingRowHeight:
                                      size.height *
                                          0.025,
                                      horizontalMargin:
                                      0,
                                      // columnSpacing:size.width*0.06,
                                      // Add column spacing for better visibility
                                      dataRowHeight:
                                      size.height *
                                          0.025,
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Date',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), // Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Order#',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Total',
                                            style: TextStyle(
                                                color: Colors.grey[
                                                700],
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                allsize *
                                                    0.012), //// Set text color for the heading
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                          order.ArchieveOrder.length,
                                              (index) {
                                            final item =
                                            order.ArchieveOrder[
                                            index];
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                    StreamBuilder<Object>(
                                                        stream: null,
                                                        builder: (context, snapshot) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                item[
                                                                'od_stmp'],
                                                                style:
                                                                TextStyle(fontSize: allsize * 0.012),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "${item['od_id']}",
                                                      style: TextStyle(
                                                          color: const Color(0xff006ccf),
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                                DataCell(
                                                    Text(
                                                      "\$${item['total']}",
                                                      style: TextStyle(
                                                          fontSize:
                                                          allsize * 0.012),
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const SubcribeWidget(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Footer(),
                  SizedBox(
                    height: size.height * 0.05,
                  )
                ],
              );
            })),
            Header_Widget(
              ontap: () => scaffoldKey.currentState!.openDrawer(),
              searchcontroller: searchcontroller,
            )
          ],
        ),
      ),
    );
  }
}
