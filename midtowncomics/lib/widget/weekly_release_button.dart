import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyReleaseButton extends StatelessWidget {
  const WeeklyReleaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(allsize*0.01),
      child: Container(
        // height: size.height * 0.09,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WEEKLY RELEASE",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff006ccf),
                        fontSize: allsize*0.019,
                        fontWeight: FontWeight.w500),
                  ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width*0.14),
                        child: Text(
                    "Updated every wednesday",
                    style: TextStyle(color: const Color(0xff7c7c7c),fontSize: allsize*0.011),
                  ),
                      )
                ],
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )),
                  backgroundColor: MaterialStatePropertyAll(Colors.white)
                ),
                  onPressed: () {},
                  child:  Center(
                      child: Text(
                    "VIEW ALL",
                    style: TextStyle(color: Colors.black,fontSize: allsize*0.012),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
