import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/Widgets/send_button.dart';

import '../../../Classes/custom_text.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/text_field.dart';
import '../../../Widgets/text_field_without_prefix.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int selected = 0;
  String prefixText="+92|";
  BoxDecoration deco = BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
      border: Border.all(color: Colors.black.withOpacity(0.3)));
  TextEditingController phone = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController address1 = new TextEditingController();
  TextEditingController address2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            roundedAppBarwithBack(context, "Profile Edit"),
            Expanded(
              child: Container(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 140,
                          width: 140,
                          // color: Colors.green,
                          child: Stack(
                            children: [
                              Container(
                                decoration: deco,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: deco,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1000),
                                            color: Constant.blueColor
                                                .withOpacity(0.8)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 12.0),
                                          child: SvgPicture.asset("Assets/pip.svg"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border:
                                          Border.all(color: Colors.white, width: 3),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        stops: [0.1, 0.9],
                                        colors: [
                                          Color(0xffEB319D),
                                          Constant.blueColor,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SvgPicture.asset("Assets/camn.svg"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Personal Information",
                          color: Colors.black,
                          size: 26,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWithOutPrefix(context,"", "First Name",
                                  true, firstName, TextInputType.text, 14),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFieldWithOutPrefix(context, "","Last Name",
                                  true, lastname, TextInputType.text, 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldBoxSmall(context, Icons.mail, "Email Address", true, email,
                            TextInputType.phone, 14),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          child: Container(
                            // height:MediaQuery.of(context).size.height/18,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: new BorderRadius.circular(2.0),
                              border: Border.all(color:Colors.black.withOpacity(0.2)),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0),
                                child: Center(
                                  child: CountryCodePicker(
                                    onChanged: (val){
                                      // print()
                                      setState(() {
                                        prefixText=val.code;
                                      });
                                    },
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: 'IT',
                                    favorite: ['+39','FR'],
                                    // optional. Shows only country name and flag
                                    showCountryOnly: true,
                                    // optional. Shows only country name and flag when popup is closed.
                                    showOnlyCountryWhenClosed: true,
                                    // optional. aligns the flag and the Text left
                                    alignLeft: true,
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldWithOutPrefix(context,prefixText ,"Phone No",
                            true, phone, TextInputType.phone, 14),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldWithOutPrefix(context,"", "Address 1",
                            true, address1, TextInputType.text, 14),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldWithOutPrefix(context,"", "Address 2",
                            true, address2, TextInputType.text, 14),     SizedBox(
                          height: 15,
                        ),
                        saveButton(context,"Save")

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
