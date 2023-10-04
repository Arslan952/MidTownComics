import 'package:flutter/material.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class PullListFAQScreen extends StatefulWidget {
  const PullListFAQScreen({super.key});

  @override
  State<PullListFAQScreen> createState() => _PullListFAQScreenState();
}

class _PullListFAQScreenState extends State<PullListFAQScreen> {
  final List<QuestionAnswer> data = [
    QuestionAnswer(
      question:
          'What is the difference between Pull List (Subscription) & Pre-Orders?',
      answer:
          'The Midtown Pull List service offers you the most freedom of any Pull List in the industry. You simply choose ten or more monthly titles,'
          ' and a shipping frequency, and every issue of your titles will be mailed to you. There\'s no'
          ' commitment, and you can cancel at any time with only a couple of days\' notice. You can add '
          'just about anything on our site to be shipped with your Pull List , all at Midtown\'s low prices. Qualifying orders get free shipping. You can also do In-store Pick up, at the store location of your choice, for FREE!\n'
          'Pre-Orders, in contrast, offer much higher discounts, but are locked in two months in advance. Every month you pre-order the items you want at unbeatable prices, and they\'ll be shipped out to you as they\'re released.',
    ),

    QuestionAnswer(
      question: 'What is my Pull List shipping cost?',
      answer:
          'Domestic: Shipping cost is determined by the dollar amount of your order (your Pull List titles to be shipped this week), like all orders from midtowncomics.com. (Click here to view shipping chart). Free In-Store Pick Up is also available at all our four store locations. Pick up at the store location of your choice with no additional cost.\n'
          'International: Shipping cost is determined by weight and will be provided during checkout where our shipping calculator will automatically calculate your shipping cost for you . Please note that we do not accept PayPal for Pull Lists.',
    ),

    QuestionAnswer(
      question:
          'How can I have additional items shipped with my Pull List titles this week?',
      answer:
          'You can add extra items such as toys, back issues, graphic novels, or just about anything on our site to your Pull List order by placing the item in your shopping cart, opening the cart, and clicking the little blue "plus" icon next to the item. Adding merchandise other than comics, books, graphic novels, or magazines, will eliminate free shipping on orders of \$89.00 and above. It’s also available for free In-Store Pick Up at all of our four store locations.',
    ),

    QuestionAnswer(
      question: 'What is the deadline for modifying my Pull List?',
      answer:
          'Deadline to make changes: If you want your changes to be effective immediately with this week\'s releases, submit them before Friday at 12PM EST. Otherwise, your changes will take effect with the titles released the following week.',
    ),
    QuestionAnswer(
      question: 'When do Pull List orders ship?',
      answer:
          'Weekly Pull Lists ship every Wednesday, of course, while bi-weekly and monthly'
          ' Pull Lists ship out every two weeks and every four weeks respectively. '
          'Because some months have five Wednesdays in them, the time during the month'
          ' when a Pull List ships out can change. When your first Pull List shipment '
          'is sent out depends on when you start your Pull List , so expect a shipment '
          'the first, second, or forth week after starting. Please note that if you start your Pull List after the Saturday deadline, there is a one-week delay in the first Pull List shipment. Also, if you suspend and restart your Pull List this can confuse our system, so if you do this and you’re concerned about when your shipment will arrive, just drop us a line and we’ll be glad to let you know when your shipment will be going out. In-Store Pick Up arrives on Wednesday too,'
          ' and an email will be sent to you when your order is ready to be picked up.',
    ),
    // Add more questions and answers as needed
  ];
  bool defaultshipping = true;
  bool defaultbilling = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
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
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "FAQ",
                      style:
                          TextStyle(fontSize:allsize*0.02, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return QuestionAnswerTile(questionAnswer: data[index]);
                      },
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const SubcribeWidget(),
                SizedBox(height: size.height*0.02,),
                Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(ontap:() => scaffoldKey.currentState!.openDrawer(),)
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

  QuestionAnswerTile({required this.questionAnswer});

  @override
  _QuestionAnswerTileState createState() => _QuestionAnswerTileState();
}

class _QuestionAnswerTileState extends State<QuestionAnswerTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var allsize=MediaQuery.of(context).size.height+MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(widget.questionAnswer.question,style: TextStyle(fontSize:allsize*0.012),),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(widget.questionAnswer.answer,style: TextStyle(fontSize:allsize*0.012)),
          ),
        ],
      ),
    );
  }
}
