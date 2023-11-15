
import 'package:midtowncomics/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final streamedDataProvider =
        Provider.of<StreamedDataProvider>(context, listen: false);
    Map<String,dynamic>data=await ApiRequests().fetchData();
      streamedDataProvider.updateData(data);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      fetchData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffd70306),
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen/splash_page.png'),
                fit: BoxFit.fill
              )
            ),
            child: Column(
        children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.3,
              ),
            ),
            SizedBox(
              height: size.height * 0.28,
            ),
            Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: allsize * 0.015, color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
               Center(
              child: Transform.scale(
                scale: allsize*0.0007,
                child: const CircularProgressIndicator(
                  color: Color(0xff016fdf),
                ),
              ),
            )
        ],
      ),
          )),
    );
  }
}
