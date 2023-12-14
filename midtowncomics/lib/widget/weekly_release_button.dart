
import 'package:midtowncomics/screen/weeklyreleasepage.dart';
import 'package:midtowncomics/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeeklyReleaseButton extends StatelessWidget {
  const WeeklyReleaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(allsize*0.006),
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
                  InkWell(
                    onTap: ()async{
                     final provider=Provider.of<StreamedDataProvider>(context,listen: false);
                     print(provider.loginuserdata);
                     final SharedPreferences prefs = await SharedPreferences.getInstance();
                     String data=prefs.getString("sh_id")??"";
                     print(data);
                    },
                    child: Text(
                      "WEEKLY RELEASES",
                      style: TextStyle(
                          color: const Color(0xff1c62b9),
                          fontFamily: 'opensans_regular',
                          fontSize: allsize*0.0175,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width*0.14),
                        child: Text(
                    "Updated every wednesday",
                    style: TextStyle(color: const Color(0xff777777),fontSize: allsize*0.011),
                  ),
                      )
                ],
              ),
              InkWell(
                onTap: (){
                  // Provider.of<WeeklyReleaseProvider>(context,listen: false). updatesortby("TITLE");
                      Get.to(const WeeklyReleasePage());
                },
                child: Container(
                  height: size.height*0.06,
                  width: size.width*0.23,
                  decoration: const BoxDecoration(
                      boxShadow: [
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
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "VIEW ALL",
                          style: TextStyle(color: Colors.black,
                              fontFamily: 'opensans_semibold',
                              fontSize: allsize*0.012,fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   style: const ButtonStyle(
              //     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              //       borderRadius: BorderRadius.zero
              //     )),
              //     backgroundColor: MaterialStatePropertyAll(Colors.white)
              //   ),
              //     onPressed: () {
              //
              //     },
              //     child:  Center(
              //         child: Text(
              //       "VIEW ALL",
              //       style: TextStyle(color: Colors.black,fontSize: allsize*0.012),
              //     )))
            ],
          ),
        ),
      ),
    );
  }
}
