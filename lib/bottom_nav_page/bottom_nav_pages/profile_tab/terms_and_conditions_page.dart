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

import '../../../auth/sign_in.dart';
import 'package:easy_localization/easy_localization.dart';
class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  int selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RoleIdentifier>(
        builder: (context,provider,child){
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                roundedAppBarwithBack(context, "termsCond".tr(),(){
                  Navigator.pop(context);
                }),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                      child: CustomText(
                        text: "termsCond".tr()=="Terms and Conditions"?provider.englishT:provider.arabicT,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
