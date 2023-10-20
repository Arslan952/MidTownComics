// import 'package:flutter/material.dart';
// class CustomDropdown extends StatefulWidget {
//   const CustomDropdown({super.key});
//
//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }
//
// class _CustomDropdownState extends State<CustomDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Dialog(
//               insetPadding: EdgeInsets.symmetric(
//                   horizontal: allsize * 0.016, vertical: allsize * 0.04),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: item.map<Widget>((String item) {
//                     return ListTile(
//                       title: Text(item),
//                       onTap: () async {
//                         setState(() {
//                           dropdownValue = item; // Update the selected value
//                         });
//                         Navigator.of(context).pop();
//                         final streamedDataProvider =
//                         Provider.of<StreamedDataProvider>(context,
//                             listen: false);
//                         int value1 = extractIntegerBeforeSpace(item);
//                         Map<String, dynamic> data = await ApiRequests()
//                             .Savedata(
//                             widget.image,
//                             item == "-Remove-" ? "0" : value1,
//                             context);
//                         streamedDataProvider.updateCartData(data);
//                         Map<String, dynamic> refresh =
//                         await ApiRequests().fetchData1(context);
//                         streamedDataProvider.updateData(refresh);
//                         // Close the dialog
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         height: size.height*0.06, // Set the desired height of the custom dropdown button
//         width: 200, // Set the desired width of the custom dropdown button
//         decoration: BoxDecoration(
//             color: Colors.grey[300]
//         ),
//         padding: EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               dropdownValue,
//               style: TextStyle(fontSize: allsize*0.014),
//             ),
//             Icon(Icons.arrow_drop_down,size: allsize*0.02,),
//           ],
//         ),
//       ),
//     );
//   }
// }
