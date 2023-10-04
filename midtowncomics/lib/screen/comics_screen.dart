import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/footer.dart';
import '../widget/header_widget.dart';
import '../widget/sidebar.dart';
import '../widget/subcribeWidget.dart';

class ComicScreen extends StatefulWidget {
  const ComicScreen({super.key});

  @override
  State<ComicScreen> createState() => _ComicScreenState();
}

class _ComicScreenState extends State<ComicScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "About Us",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: size.height * 0.03,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        color: const Color(0xff00ACEE),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            "Follow Us @MidtownComics",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Midtown Comics first opened its door in 1997 and has since become the leading"
                                " comic book retailer in the U.S. with its online store as well as three landmark"
                                " locations in New York City: Times Square, Grand Central and Downtown.\n"
                                "We always have the hottest publishers and trending topics available, including DC"
                                " Comics, Marvel Comics, the New Age of DC Heroes, Marvel Legacy, DC Rebirth, Image Comics,"
                                " and more! The greatest characters of all time are here too, including Batman, Superman, Wonder"
                                " Woman, Supergirl, Spider-Man, the Avengers, the Flash, Captain America, the X-Men, Green "
                                "Lantern, Wolverine, Black Widow, Thor, Daredevil, Dr. Strange, Jessica Jones, Iron Fist,"
                                " the Defenders, Captain Marvel, Ms. Marvel, the Punisher, Green Arrow, the Incredible Hulk, "
                                "Iron Man, Hellboy, Fantastic Four, the Walking Dead, iZombie, Luke Cage, Kingsman, Suicide Squad,"
                                " Harley Quinn, and more!\n"
                                "Midtown Comics is the go-to place for the best comic book subscription service to Marvel Comics, DC Comics,"
                                " and all publishers. DC Subscriptions, Marvel Subscriptions, and all subscriptions can be found"
                                " online or at our NYC stores!\n"
                                "Shop online: Midtown Comics is committed to providing great service and prices, and making the shopping experience"
                                " as much fun as reading and collecting. It's not just about comics! Midtown Comics offers a vast"
                                " selection of comic book related action figures, statues, movies, books and so much"
                                " more, all available online and in-store.\n"
                                "Creator Signings: Midtown's New York stores are home to many exciting creator signings."
                                " Our guest creators have included Brian Michael Bendis, Geoff Johns, Scott Snyder, Greg Capullo,"
                                " Garth Ennis, Frank Miller, Alex Ross, Jim Lee, Kevin Smith, Brian K. Vaughan, Mark Waid, Gail"
                                " Simone, J.G. Jones, Peter David, Greg Pak, Jeff Smith, Paul Dini, Greg Rucka, John Romita Jr."
                                " and Neal Adams to name a few. Many signed books and exclusive or variant covers"
                                " are available online.\n"
                                "New York Comic-Con: Midtown Comics is a retail sponsor of NYCC,"
                                " and has been associated with the con since inception. Midtown's NYCC"
                                " mega-booth includes discounts on all books, contests, prizes, and more!\n"
                                "Want to stay up to date with all things Midtown? Want access to exclusive deals and giveaways? Then follow us on "
                                "Twitter, Facebook, Instagram , Youtube, and more!"),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Email: info@midtowncomics.com\n"
                              "Tel:800.411.3341(or 212.302.8192)\n"
                              "If you're interested in selling your collection,please contact:\n"
                              "Email:webuy@midtowncomics.com\n"
                              "Tel:646.452.8173",
                              style: TextStyle(color: Colors.black54),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              "VISIT US IN NEW YORK CITY!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Store Hours,info & Direction",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/TS-a_300.jpg'))),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Times Square',
                                  style: TextStyle(color: Color(0xff006ccf)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/GC-a_300.jpg'))),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Grand Central',
                                  style: TextStyle(color: Color(0xff006ccf)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/DT-0_300.jpg'))),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Downtown',
                                  style: TextStyle(color: Color(0xff006ccf)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const SubcribeWidget(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Footer(),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            )),
            Header_Widget(
              ontap: () => scaffoldKey.currentState!.openDrawer(),
            )
          ],
        ),
      ),
    );
  }
}
