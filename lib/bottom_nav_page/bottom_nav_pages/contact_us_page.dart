import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/profile_tab/my_ads_page.dart';

import '../../Widgets/text_field_without_prefix.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController name=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController description=new TextEditingController();
  int selected=2;

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Constant.blueColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                     contactUsFieldItem(context,100,0,selected,"Name",TextInputType.text,name,"Assets/namei.svg",(){
                                     setState(() {
                                       selected=0;
                                     });
                                     },),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     contactUsFieldItem(context,10,1,selected,"Phone no",TextInputType.phone,phone,"Assets/phonei.svg",(){
                                       setState(() {
                                         selected=1;
                                       });
                                     },),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFieldWithDetectorBig(context,"","Description",true,description,TextInputType.text,1000,(){
                                          setState(() {
                                            selected=2;
                                          });
                                        }),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        sendButton(context),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Container(
                                height: 25,
                                width: 110,
                                color: Colors.white,
                                child: Center(
                                  child: CustomText(
                                    text: "Contact Us",
                                    color: Constant.darkblue.withOpacity(0.8),
                                    size: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset("Assets/contactI@3x.png",height: MediaQuery.of(context).size.width/1.6,))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  contactUsFieldItem(BuildContext context,int limit,int current , int select,String hint,TextInputType inp,TextEditingController controller,String img,Function ontap) {
    return  Row(
      children: [
        SvgPicture.asset(img,height: 30,color: current==select?Constant.blueColor:Colors.black.withOpacity(0.4)),
        SizedBox(
          width: 5,
        ),
        Expanded(child: TextFieldWithDetector(context,"",hint,true,controller,inp,limit,ontap))
      ],
    );
  }

}
