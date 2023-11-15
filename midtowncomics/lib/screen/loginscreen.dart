
import 'package:midtowncomics/export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checked = false;
  TextEditingController email = TextEditingController(text: "acifjee@gmail.com");
  TextEditingController password = TextEditingController(text:"asdfgh");
  TextEditingController searchcontroller=TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child:      Consumer<StreamedDataProvider>(
        builder: (context, provider, child) {
          return   Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.157,
                      ),
                      Consumer<StreamedDataProvider>(
                          builder: (context, provider, child) {
                            return Column(
                              children: [
                                provider.showsearchlist == true
                                    ? provider.returnproduct.isEmpty
                                    ? Container()
                                    : ListView.builder(
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                    provider.returnproduct.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            searchcontroller
                                                .text = provider
                                                .returnproduct[index]
                                            ['pr_ttle'];
                                          });
                                          provider.updatesearchselextion(
                                              provider.returnproduct[
                                              index]['pr_ttle']);
                                        },
                                        child: Container(
                                          color: index % 2 == 0
                                              ? const Color(0xffececec)
                                              : Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                allsize * 0.005),
                                            child: RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    fontSize:
                                                    allsize * 0.012,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      "${provider.returnproduct[index]['pr_ttle']}-",
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff818181))),
                                                  TextSpan(
                                                      text:
                                                      provider.returnproduct[
                                                      index]
                                                      ['cg_name'],
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff217fda))),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                    : Container(),
                              ],
                            );
                          }),
                      Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: allsize * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      provider.loindata.isEmpty?Container():
                      Text(provider.loindata['DESCRIPTION']=="OK"?"You have Login Successfully.Please wait.....":provider.loindata['DESCRIPTION'],style:
                        TextStyle(color: (provider.loindata['DESCRIPTION']=="OK"?Colors.green:Colors.red),fontSize:allsize*0.015,fontWeight: FontWeight.bold),),
                      TextFormField(
                        style: TextStyle(fontSize: allsize * 0.012),
                      controller: email,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: allsize * 0.012),
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                        Transform.scale(
                          scale: allsize * 0.0007,
                          child: Checkbox(
                            activeColor: const Color(0xff006ccf),
                            value: checked,
                            onChanged: (newValue) {
                              setState(() {
                                checked = newValue!;
                              });
                            },
                          ),
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(fontSize: allsize * 0.012),
                        )
                      ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      InkWell(
                        onTap: ()async{
                          final streamedDataProvider =
                          Provider.of<StreamedDataProvider>(context, listen: false);
                          Map<String,dynamic>data=await ApiRequests().LoginUser(email.text,password.text, context);
                          // streamedDataProvider.updateData(data);
                        },
                        child: Container(
                          height: size.height * 0.07,
                          color: const Color(0xff006ccf),
                          child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: allsize * 0.013),
                          ),
                        ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                      "Login with your Social Account",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: allsize * 0.014,
                          fontWeight: FontWeight.w700),
                    ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/google.png"),
                          SizedBox(
                            width: size.width * 0.3,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: allsize * 0.013),
                          ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.01,),
                      provider.changeindicator==true?const Center(child: CircularProgressIndicator(),):Container()
                    ],
                  ),
                ),
              ),
              Header_Widget(
                ontap: () => scaffoldKey.currentState!.openDrawer(),
                searchcontroller: searchcontroller,
              )
            ],
          );
        })
      ),
    );
  }
}
