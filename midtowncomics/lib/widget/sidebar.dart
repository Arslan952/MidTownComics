import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midtowncomics/screen/comics_screen.dart';
import 'package:midtowncomics/screen/weekly_release.dart';

class Custom_drawer extends StatefulWidget {
  const Custom_drawer({Key? key}) : super(key: key);

  @override
  State<Custom_drawer> createState() => _Custom_drawerState();
}

class _Custom_drawerState extends State<Custom_drawer> {
  @override
  Widget build(BuildContext context) {
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        width: size.width*0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: const Color(0xff006ccf),
              height: 60,
              child: Center(
                child: Text(
                  "HOME",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: allsize*0.016),
                ),
              ),
            ),
            ListTile(
              title:  Text("Weekly Release",style: TextStyle(fontSize: allsize*0.013),),
              onTap: (){
                // Get.off(const WeeklyReleaseScreen());
              },
            ),
            ListTile(
              title:  Text("Comics",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){
                Get.off(ComicScreen());
              },
            ),
            ListTile(
              title:  Text("Varient/Incentive",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Back Issues",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Graphic Novels",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Books",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Magazines",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Manga",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Apparel",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Status",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Action Figure",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Collectibles",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Gaming and Cards",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("DVD'S",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Supplies",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Clearence",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Pull List",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Pre Orders",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Deal of the Day",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Gift Card",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
            ListTile(
              title: Text("Browsing Histoy",style: TextStyle(fontSize: allsize*0.013)),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
