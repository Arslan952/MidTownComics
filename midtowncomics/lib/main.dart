
import 'package:midtowncomics/provider/addressprovider.dart';
import 'package:midtowncomics/provider/creditcardprovider.dart';
import 'package:midtowncomics/provider/orderprovider.dart';
import 'package:midtowncomics/provider/settingProvider.dart';

import 'export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Error:\n${details.exception}",
        style: const TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  };
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff004674),
      ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StreamedDataProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => WeeklyReleaseProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => CreditCardProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => AccountSettingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Midtown Comics',
      theme: ThemeData(
          // useMaterial3: true,
          fontFamily: GoogleFonts.openSans().fontFamily,
          colorSchemeSeed: const Color(0xff006ccf),
          scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(const Color(0xff006ccf)),
          )),
      home: const SplashScreen(),
    );
  }
}
