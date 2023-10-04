import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  Function() ontap;
  String title;
   TextButtonWidget({super.key,required this.ontap,required this.title});

  @override
  Widget build(BuildContext context) {
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return InkWell(
        onTap:ontap,
        child: Text(
          title,
          style: TextStyle(color: const Color(0xff8b8b8b), fontSize: allsize*0.013),
        ));
  }
}
