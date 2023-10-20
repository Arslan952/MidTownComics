import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midtowncomics/screen/newsletterscreen.dart';
class SubcribeWidget extends StatelessWidget {
  const SubcribeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Container(
      // height:  MediaQuery.of(context).size.shortestSide < 550?size.height * 0.21:size.height*0.23,
      width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius:0.3,
              offset: Offset(2, 2),
            ),
          ],
        ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 Text(
                "Get The Latest Scoop!",
                style: GoogleFonts.openSans(
                    color: const Color(0xff006ccf),
                    fontSize: allsize*0.027,
                    fontWeight: FontWeight.w600),
              ),
                  Text(
                "Subscribe To Our NewsLetter For Special Saving And Offers!",
                style: TextStyle(color: Colors.grey[700],fontSize: allsize*0.0126,fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height*0.007,),
              Center(
                child: InkWell(
                  onTap: (){
                    Get.to(const NewsLetterScreen());
                  },
                  child: Container(
                    height: size.height * 0.045,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: Color(0xff006ccf),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.2), // Shadow color
                      //     spreadRadius: 1, // Spread radius
                      //     blurRadius: 2, // Blur radius
                      //     offset: const Offset(0, 2), // Offset from the top-left corner
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: Text(
                        "SUBSCRIBE",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: allsize * 0.016,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  ,
                ),
              ),
              SizedBox(height: size.height*0.01,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Weekly",style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0113),),
                  Text('Daily Deals',style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0113)),
                  Text("Back Issue",style: TextStyle(color: Colors.grey[600],fontSize: allsize*0.0113))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
