import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/contact_us_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/favourites.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/home_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/profile_home.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key key}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: IndexedStack(
                index: selected,
                children: [
                  HomePage(),
                  FavouritesPage(),
                  ContactUsPage(),
                  ProfileHomePage(),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.red,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                bottomItem("Assets/homeFilled.svg",
                                    "Assets/homeLiner.svg", selected, 0, () {
                                  setState(() {
                                    selected = 0;
                                  });
                                }),
                                bottomItem("Assets/heartnfilled.svg",
                                    "Assets/heartLiner.svg", selected, 1, () {
                                  setState(() {
                                    selected = 1;
                                  });
                                }),
                                Container(),
                                bottomItem("Assets/messagecallfilled.svg",
                                    "Assets/mailLiner.svg", selected, 2, () {
                                  setState(() {
                                    selected = 2;
                                  });
                                }),
                                bottomItem(
                                    "Assets/personfilled.svg",
                                    "Assets/personLiner.svg",
                                    selected,
                                    3, () {
                                  setState(() {
                                    selected = 3;
                                  });
                                }),
                              ],
                            ),
                            color: Constant.darkblue,
                          ),
                        ],
                      ),
                     Align(
                       alignment: Alignment.topCenter,
                       child:
                       GestureDetector(
                         onTap: (){

                         },
                         child: Container(
                           height: 55,
                           width: 55,
                           decoration: BoxDecoration(
                               color:
                         Constant.darkblue,
                               borderRadius: BorderRadius.circular(100),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black.withOpacity(0.1),
                                 spreadRadius: 5,
                                 blurRadius: 7,
                                 offset: Offset(0, 3), // changes position of shadow
                               ),
                             ],),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: SvgPicture.asset(
                               "Assets/plussss.svg",
                               color: Colors.white,
                             ),
                           ),
                         ),
                       )
                       // bottomItem(
                       //     "Assets/plussss.svg", "Assets/plussss.svg", 0, 0,
                       //         () {
                       //       // s
                       //     }),
                     )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bottomItem(String filledImage, String outlinedImage, int seleced, int current,
      Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color:
                current == selected ? Constant.blueColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            current == selected ? filledImage : outlinedImage,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
