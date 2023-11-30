
import 'package:midtowncomics/export.dart';
import 'package:midtowncomics/widget/searchList.dart';

class PushNotificationSetting extends StatefulWidget {
  const PushNotificationSetting({super.key});

  @override
  State<PushNotificationSetting> createState() =>
      _PushNotificationSettingState();
}

class _PushNotificationSettingState extends State<PushNotificationSetting> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: const Custom_drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.16),
                SearchList(searchcontroller: searchController),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const SubcribeWidget(),
                SizedBox(height: size.height*0.02,),
                const Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(
              searchcontroller: searchController,
              ontap:() => scaffoldKey.currentState!.openDrawer(),)
          ],
        ),
      ),
    );
  }
}
