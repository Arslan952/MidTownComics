
import 'package:midtowncomics/export.dart';

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
          borderRadius: BorderRadius.circular(allsize*0.003),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius:0.1,
                offset: Offset(0.8, 1), // Right and bottom shadow
              ),
              BoxShadow(
                color: Colors.black12,
                blurRadius:0.1,
                offset: Offset(-1, 0), // Left and bottom shadow
              ),
            ]
        ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(allsize*0.003),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 Text(
                "Get The Latest Scoop!",
                style: TextStyle(
                    color: const Color(0xff006ccf),
                    fontSize: allsize*0.023,
                    fontFamily: 'opensans_semibold',
                    fontWeight: FontWeight.w600),
              ),
                  Text(
                "Subscribe To Our NewsLetter For Special Saving And Offers!",
                style: TextStyle(color: Colors.grey[700],
                    fontSize: allsize*0.0115,
                    fontFamily: 'opensans_regular',
                    fontWeight:FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height*0.007,),
              Center(
                child: InkWell(
                  onTap: (){
                    Get.to(const NewsLetterScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.29),
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius:0.1,
                              offset: Offset(0, 0.65), // Right and bottom shadow
                            ),
                          ]
                      ),
                      child: Container(
                        height: size.height * 0.046,
                       width:double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(allsize*0.0015),
                          color: const Color(0xff006ccf),
                        ),
                        child: Center(
                          child: Text(
                            "SUBSCRIBE",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'opensans_semibold',
                              fontSize: allsize * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  ,
                ),
              ),
              SizedBox(height: size.height*0.01,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
                 child: Padding(
                   padding: EdgeInsets.only(left: size.width*0.06),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Weekly",style: TextStyle(color: Colors.grey[600],
                          fontFamily: 'opensans_regular',
                          fontSize: allsize*0.0105),),
                      Text('Daily Deals',style: TextStyle(color: Colors.grey[600],
                          fontFamily: 'opensans_regular',
                          fontSize: allsize*0.0105)),
                      Text("Back Issues",style: TextStyle(color: Colors.grey[600],
                          fontFamily: 'opensans_regular',
                          fontSize: allsize*0.0105))
                    ],
              ),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
