
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/password_withOut_prefix.dart';
import 'package:realestate/Widgets/text_field_without_prefix.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController confirmPass = new TextEditingController();
  TextEditingController password = new TextEditingController();
    bool visible1=false,visible2=false,agree=false;
    String prefixText="+92";
    String countryc="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            background(context),
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:SingleChildScrollView(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.height / 4.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                // color: Colors.deepOrange
                              ),
                              child: Image.asset(
                                "Assets/realestateL@3x.png",
                                fit: BoxFit.contain,
                                // height: 20,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Sign Up",
                          fontWeight: FontWeight.w800,
                          size: 30,
                        ),
                        SizedBox(
                          height: 30,
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
                          height: 10,
                        ),
                        GestureDetector(
                         // onTap: (){
    //                        //   showCountryPicker(
    //                        //     context: context,
    //                        //     countryListTheme: CountryListThemeData(
    //                        //       flagSize: 25,
    //                        //       backgroundColor: Colors.white,
    //                        //       textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
    //                        //       //Optional. Sets the border radius for the bottomsheet.
    //                        //       borderRadius: BorderRadius.only(
    //                        //         topLeft: Radius.circular(20.0),
    //                        //         topRight: Radius.circular(20.0),
    //                        //       ),
    //                        //       //Optional. Styles the search field.
    //                        //       inputDecoration: InputDecoration(
    //                        //         labelText: 'Search',
    //                        //         hintText: 'Start typing to search',
    //                        //         prefixIcon: const Icon(Icons.search),
    //                        //         border: OutlineInputBorder(
    //                        //           borderSide: BorderSide(
    //                        //             color: const Color(0xFF8C98A8).withOpacity(0.2),
    //                        //           ),
    //                        //         ),
    //                        //       ),
    //                        //     ),
    //                        //     onSelect: (Country country) {
    //                        //       setState(() {
    //                        //         print(country);
    //                        //         prefixText="+${country.phoneCode}";
    //                        //         countryc=country.toString();
    //                        //       });
    //                        //     },
    //                        //   );
    //                    },
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
                        // IntlPhoneField(
                        //   decoration: InputDecoration(
                        //     labelText: 'Phone Number',
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(),
                        //     ),
                        //   ),
                        //   initialCountryCode: 'IN',
                        //   onChanged: (phone) {
                        //     print(phone.completeNumber);
                        //   },
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithOutPrefix(context,prefixText ,"Phone No",
                            true, phone, TextInputType.phone, 14),
                        SizedBox(
                          height: 10,
                        ),
                        // TextFieldWithOutPrefix(context, "Phone No", true,
                        //     phone, TextInputType.phone, 14),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PasswordWithoutPrefix(
                                  context,
                                  visible1,
                                  "Password",
                                  true,
                                  password,
                                  TextInputType.phone,
                                  14,(){
                                setState(() {
                                  visible1=!visible1;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: PasswordWithoutPrefix(context, visible2, "Confirm password", true,
                                  confirmPass, TextInputType.phone, 14,(){
                                  setState(() {
                                    visible2=!visible2;
                                  });
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // TextField(
                        //     maxLines: 1,
                        //     decoration: InputDecoration(
                        //       // lableText:"Full name",
                        //       // hintText: 'Full name',
                        //      labelText: "full name",
                        //       border: OutlineInputBorder(),
                        //     )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                             onTap: (){
                               setState(() {
                                 agree=!agree;
                               });
                             },
                              child: Icon(
                                agree==true?Icons.check_box:Icons.check_box_outline_blank,
                                size: 22
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: "I Agree to terms T&C",
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        bigButton(context, "Register", () {}),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                        ),
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
