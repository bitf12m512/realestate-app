import 'package:auto_direction/auto_direction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/edit_profile_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/my_ads_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/notification_list_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/terms_and_conditions_page.dart';

import '../../../auth/sign_in.dart';
import 'package:easy_localization/easy_localization.dart';
class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({Key key}) : super(key: key);

  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  int selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<RoleIdentifier>(
      builder: (context,provider,child){
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              roundedAppBar(context, "profile".tr()),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditProfilePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: provider.appuser.firstName==null?"Unknown":provider.appuser.firstName+" "+provider.appuser.lastName,
                                    fontWeight: FontWeight.w500,
                                    size: 25,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoDirection(
                                    text: provider.appuser.phoneNumber,
                                    child: CustomText(
                                      text:provider.appuser.phoneNumber==null?"":provider.appuser.phoneNumber,
                                      fontWeight: FontWeight.w500,
                                      size: 12,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ProfilePicBox(),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //
                                  //     Navigator.of(context).push(
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 EditProfilePage()));
                                  //   },
                                  //   child: SvgPicture.asset(
                                  //     "Assets/editp.svg",
                                  //     height: 30,
                                  //     color: Colors.black.withOpacity(0.4),
                                  //   ),
                                  // )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.6),
                          thickness: 1.2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        tileiTem2("language".tr()),
                        tileiTem("Assets/notil.svg", "notifications".tr(), () {

                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationsListPage()));
                        }),
                        tileiTem("Assets/buildl.svg", "myAds".tr(), () {

                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyAddsPage()));
                        }),
                        // tileiTem("Assets/maill.svg", "inviteFriends".tr(), () {}),
                        // tileiTem("Assets/handl.svg", "feedBack".tr(), () {}),
                        tileiTem("Assets/notel.svg", "termsCond".tr(), () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TermsAndConditionsPage()));
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (_) => ()));
                        }),
                        LogoutItem("Assets/logoutl.svg",'logot'.tr(), () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (_) => SignInPage()));
                        }),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // GestureDetector(
                        //   onTap: (){
                        //     FirebaseAuth.instance.signOut();
                        //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //         builder: (_) => SignInPage()));
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal:8.0),
                        //         child: SvgPicture.asset(
                        //           "Assets/logoutl.svg",
                        //           color: Colors.redAccent,
                        //           height: MediaQuery.of(context).size.height / 36,
                        //         ),
                        //       ),
                        //       CustomText(
                        //         text:'logot'.tr(),
                        //         fontWeight: FontWeight.w500,
                        //         size: 16,
                        //         color: Colors.redAccent,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ProfilePicBox() {
    return Consumer<RoleIdentifier>(
      builder: (context,provider,child){
        return Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: Constant.blueColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: provider.appuser.imgurl==null?Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "Assets/personfilled.svg",
              color: Colors.white,
            ),
          ):ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              provider.appuser.imgurl,
              // color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  tileiTem(String img, String title, Function ontap) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: SvgPicture.asset(
                          img,
                          height: MediaQuery.of(context).size.height / 36,
                        ),
                      ),
                      CustomText(
                        text:title,
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: Colors.black.withOpacity(0.65),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black.withOpacity(0.4),
                    size: 20,
                  )
                ],
              ),
            )),
      ),
    );
  }
  LogoutItem(String img, String title, Function ontap) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Constant.blueColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: SvgPicture.asset(
                          img,
                          height: MediaQuery.of(context).size.height / 36,
                          color:  Constant.blueColor,
                        ),
                      ),
                      CustomText(
                        text:title,
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color:  Constant.blueColor,
                      ),
                    ],
                  ),
                  // Icon(
                  //   Icons.arrow_forward_ios_rounded,
                  //   color: Colors.black.withOpacity(0.4),
                  //   size: 20,
                  // )
                ],
              ),
            )),
      ),
    );
  }
  tileiTem2( String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Icon(Icons.language,size:MediaQuery.of(context).size.height / 36 ,color: Colors.black.withOpacity(0.3),)

                        // SvgPicture.asset(
                        //   img,
                        //   height: MediaQuery.of(context).size.height / 36,
                        // ),
                      ),
                      CustomText(
                        text:title,
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: Colors.black.withOpacity(0.65),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color: Colors.black
                            .withOpacity(0.03)),
                    child: Row(
                      children: [
                        langugeItem(
                            context,
                            'language'.tr().contains("Language")?0:1,
                            1,
                            "arabic".tr(), () {
                          Jiffy.locale('ar');
                          context.setLocale(context.supportedLocales[1]);
                        }),
                        langugeItem(
                            context,
                            'language'.tr().contains("Language")?0:1,
                            0,
                            'english'.tr(), () {
                          Jiffy.locale('en');
                          context.setLocale(context.supportedLocales[0]);
                        }),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
  langugeItem(BuildContext context, int sl, int i, String s, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        // Define how long the animation should take.
        duration: Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        height: 20,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: sl == i ? Constant.blueColor : Colors.transparent),
        child: Center(
          child: CustomText(
            text: s,
            size: 8,
            color: sl == i ? Colors.white : Colors.black.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
  }
