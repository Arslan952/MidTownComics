// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:midtowncomics/export.dart';
import 'package:midtowncomics/widget/searchList.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQScreen extends StatefulWidget {
  List<dynamic>data=[];
  String faqTopic;
   FAQScreen({super.key,required this.data,required this.faqTopic});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool defaultshipping = true;
  bool defaultbilling = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
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
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                            fontSize: allsize * 0.017,
                            fontFamily: 'oswald_bold',
                            fontWeight: FontWeight.bold),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(widget.faqTopic,style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: allsize*0.015
                        ),),
                      ),
                      Container(
                        width: size.width*1,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Container(
                          width: size.width*1,
                          color: const Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.data.length,
                              itemBuilder: (context, index) {
                                return Theme(
                                  data: ThemeData(
                                      visualDensity: const VisualDensity(vertical: -4),
                                    dividerColor: Colors.transparent,
                                  ),
                                  child: ExpansionTile(
                                    childrenPadding: EdgeInsets.zero,
                                    tilePadding: EdgeInsets.zero,
                                    trailing:const Text(""),
                                    title: RichText(
                                      text: HTML.toTextSpan(
                                        context, widget.data[index]['question'],
                                        defaultTextStyle: TextStyle(
                                            fontSize: allsize * 0.012,
                                            color: const Color(0xff006ccf),
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    onExpansionChanged: (value) {
                                    },
                                    children:[
                                      Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: RichText(
                                            text: HTML.toTextSpan(
                                              context,widget.data[index]['answer'],
                                                linksCallback: (link) async{
                                                  if (!await launchUrl(Uri.parse(link))) {
                                                  throw Exception('Could not launch ${Uri.parse(link)}');
                                                  }
                                                },
                                              defaultTextStyle: TextStyle(
                                                  fontSize: allsize * 0.012
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: size.height*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Note:We reserve the right to cancel any order at our discretion",style: TextStyle(
                          fontSize: allsize*0.011,
                          fontStyle: FontStyle.italic
                        ),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const SubcribeWidget(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Footer(),
                  SizedBox(
                    height: size.height * 0.05,
                  )
                ],
              ),),
            Header_Widget(
              searchcontroller: searchController,
              ontap: () => scaffoldKey.currentState!.openDrawer(),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({required this.question, required this.answer});
}

class QuestionAnswerTile extends StatefulWidget {
  final QuestionAnswer questionAnswer;

  const QuestionAnswerTile({super.key, required this.questionAnswer});

  @override
  _QuestionAnswerTileState createState() => _QuestionAnswerTileState();
}

class _QuestionAnswerTileState extends State<QuestionAnswerTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var allsize =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        trailing: Container(
          width: 0,
        ),
        title: Text(
          widget.questionAnswer.question,
          style: TextStyle(
              fontSize: allsize * 0.013,
              color: const Color(0xff006ccf),
              fontWeight: FontWeight.w600),
        ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.questionAnswer.answer,
                style: TextStyle(fontSize: allsize * 0.012)),
          ),
        ],
      ),
    );
  }
}
