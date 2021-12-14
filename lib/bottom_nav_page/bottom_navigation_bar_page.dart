import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/read_data.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/contact_us_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/create_property_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/favourites.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/home_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/profile_home.dart';
import 'package:easy_localization/easy_localization.dart';
class BottomNavPage extends StatefulWidget {
  // const BottomNavPage({Key key}) : super(key: key);
String uid;
BottomNavPage(this.uid);
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selected = 0;
  ScrollController controller1;
  ScrollController controller2;
  ScrollController controller3;
  @override
  void initState() {
    // TODO: implement initState
  setJiffyLocale();
  readData(context);
  controller1 = new ScrollController();
  controller2 = new ScrollController();
  controller3 = new ScrollController();

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<RoleIdentifier>(builder: (context,provider,child){
      return WillPopScope(
        onWillPop: () async {
          showConfirmationDialog(
              context, "Are you sure you want to close the app?".tr(), () {
            SystemNavigator.pop();
          });
          // if (_key.currentState.canPop()) {
          //   _key.currentState.pop();
          //   return false;
          // }
          return true;
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:provider.propertiesBack==null?
                      Center(child: CircularProgressIndicator())
                      : IndexedStack(
                    index: selected,
                    children: [
                      HomePage(controller1),
                      FavouritesPage(controller2),
                      CreatePropertyPage(),
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
                                        "Assets/HOUT.svg", selected, 0, () {
                                          FocusScopeNode currentFocus = FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          setState(() {
                                            selected = 0;
                                            controller1.animateTo(
                                              0,
                                              duration: Duration(seconds: 2),
                                              curve: Curves.fastOutSlowIn,
                                            );
                                          });

                                        }),
                                    bottomItem("Assets/heartnfilled.svg",
                                        "Assets/heartLiner.svg", selected, 1, () {
                                          FocusScopeNode currentFocus = FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          setState(() {
                                            selected = 1;
                                            controller2.animateTo(
                                              0,
                                              duration: Duration(seconds: 2),
                                              curve: Curves.fastOutSlowIn,
                                            );
                                          });
                                        }),
                                    Container(),
                                    // bottomItem("Assets/building_filled.svg",
                                    //     "Assets/building_outline.svg", selected, 3, () {
                                    //   setState(() {
                                    //     selected = 3;
                                    //   });
                                    // }),
                                    bottomItem("Assets/messagecallfilled.svg",
                                        "Assets/mailLiner.svg", selected, 3, () {
                                          FocusScopeNode currentFocus = FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          setState(() {
                                            selected = 3;
                                          });
                                        }),
                                    bottomItem(
                                        "Assets/personfilled.svg",
                                        "Assets/personLiner.svg",
                                        selected,
                                        4, () {
                                      FocusScopeNode currentFocus = FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      setState(() {
                                        selected = 4;
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
                                  FocusScopeNode currentFocus = FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  setState(() {
                                    selected=2;
                                  });
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
        ),
      );
    });
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

  void setJiffyLocale() {
    setState((){
      if(  "totalPoints".tr()=="All Points"){
        Jiffy.locale('en');
      }
     else{
       Jiffy.locale('ar');
      }

    });
  }
}
