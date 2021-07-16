import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/my_ads_page.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          roundedAppBar(context, "Contact Us"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "User Name",
                              fontWeight: FontWeight.w500,
                              size: 25,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: "+898 7678 76678",
                              fontWeight: FontWeight.w500,
                              size: 12,
                              color: Colors.black.withOpacity(0.4),
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
                            SvgPicture.asset(
                              "Assets/editp.svg",
                              height: 30,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.6),
                      thickness: 1.2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    tileiTem("Assets/notil.svg", "Notification", () {}),
                    tileiTem("Assets/buildl.svg", "My Ads", () {

                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyAddsPage()));
                    }),
                    tileiTem("Assets/maill.svg", "Invite Friends", () {}),
                    tileiTem("Assets/handl.svg", "Feed Back", () {}),
                    tileiTem("Assets/notel.svg", "Terms & Conditions", () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: SvgPicture.asset(
                            "Assets/logoutl.svg",
                            color: Colors.redAccent,
                            height: MediaQuery.of(context).size.height / 36,
                          ),
                        ),
                        CustomText(
                          text:"Logout",
                          fontWeight: FontWeight.w500,
                          size: 16,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ProfilePicBox() {
    return GestureDetector(
      // onTap: ontap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Constant.blueColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "Assets/personfilled.svg",
            color: Colors.white,
          ),
        ),
      ),
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
                        size: 16,
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
}
