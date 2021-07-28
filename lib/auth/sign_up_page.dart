import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Function/service.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/password_withOut_prefix.dart';
import 'package:realestate/Widgets/text_field_without_prefix.dart';
import 'package:realestate/auth/code_page.dart';
import 'package:toast/toast.dart';

import '../bottom_nav_page/bottom_navigation_bar_page.dart';

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
  bool visible1 = false, visible2 = false, agree = false;
  String prefixText = "+92";
  String countryc = "";
  CountryCode countryCode=new CountryCode(dialCode: "+92",code: "PK",name: "Pakistan",flagUri: "flags/pk.png");
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
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
                                child: TextFieldWithOutPrefix(
                                    context,
                                    "",
                                    "First Name",
                                    true,
                                    firstName,
                                    TextInputType.text,
                                    14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFieldWithOutPrefix(
                                    context,
                                    "",
                                    "Last Name",
                                    true,
                                    lastname,
                                    TextInputType.text,
                                    14),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Container(
                              // height:MediaQuery.of(context).size.height/18,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(2.0),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: CountryCodePicker(
                                      onChanged: (val) {
                                        setState(() {
                                          countryCode=val;
                                          print(val.name);
                                          prefixText = val.dialCode;
                                        });
                                      },
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      initialSelection: 'IT',
                                      favorite: ['+92', 'PK'],
                                      // optional. Shows only country name and flag
                                      showCountryOnly: true,
                                      // optional. Shows only country name and flag when popup is closed.
                                      showOnlyCountryWhenClosed: true,
                                      // optional. aligns the flag and the Text left
                                      alignLeft: true,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldWithOutPrefix(context, prefixText,
                              "Phone No", true, phone, TextInputType.phone, 14),
                          SizedBox(
                            height: 10,
                          ),
                          // TextFieldWithOutPrefix(context, "Phone No", true,
                          //     phone, TextInputType.phone, 14),
                          SizedBox(
                            height: 10,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: PasswordWithoutPrefix(
                          //           context,
                          //           visible1,
                          //           "Password",
                          //           true,
                          //           password,
                          //           TextInputType.phone,
                          //           14,(){
                          //         setState(() {
                          //           visible1=!visible1;
                          //         });
                          //       }),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Expanded(
                          //       child: PasswordWithoutPrefix(context, visible2, "Confirm password", true,
                          //           confirmPass, TextInputType.phone, 14,(){
                          //           setState(() {
                          //             visible2=!visible2;
                          //           });
                          //           }),
                          //     ),
                          //   ],
                          // ),
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
                                onTap: () {
                                  setState(() {
                                    agree = !agree;
                                  });
                                },
                                child: Icon(
                                    agree == true
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    size: 22),
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
                          bigButton(context, "Register", () {
                            if (_formKey.currentState.validate()) {
                              if (agree == true) {
                                print("${prefixText}${phone.text}");
                                handelOTPSignup();
                              } else {
                                Toast.show(
                                    "Make Sure You agree to our Terms and Conditions.",
                                    context,
                                    duration: 4,
                                    gravity: Toast.TOP);
                              }
                            }
                          }),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> handelOTPSignup() async {
    showAlertDialog(context, "Please Wait...");
    try {
      print("account created not yet");
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "${prefixText}${phone.text}".toString(),
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) {},
          verificationFailed: (FirebaseAuthException authException) {
            Navigator.of(context).pop();
            if (authException.toString().contains(
                "We have blocked all requests from this device due to unusual activity. Try again later.")) {
              Toast.show(
                  "We have blocked all requests from this device is blocked due to unusual activity. Try again later. ",
                  context,
                  duration: 4,
                  gravity: Toast.TOP);
            } else {
              Toast.show(
                  "Please enter a valid"
                  " contact number. Follow the +123 34323454 format.",
                  context,
                  duration: 4,
                  gravity: Toast.TOP);
            }
          },
          codeSent: codeSe,
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      Navigator.of(context).pop();
      if (e.code == "WEAK-PASSWORD".toLowerCase())
        Toast.show('Password must be at least 6 characters long', context,
            duration: 4, gravity: Toast.TOP);
      if (e.code == "user-not-found".toLowerCase())
        Toast.show(
            'There is no user corresponding to this email address.', context,
            duration: 4, gravity: Toast.TOP);
      else if (e.code == "INVALID-EMAIL".toLowerCase())
        Toast.show(
            'Please enter the email with correct format, Like abc@email.com.',
            context,
            duration: 4,
            gravity: Toast.TOP);
      else if (e.code == "EMAIL-ALREADY-IN-USE".toLowerCase())
        Toast.show('Email already in use', context,
            duration: 4, gravity: Toast.TOP);
      else if (e.code == "wrong-password".toLowerCase())
        Toast.show('Please enter correct password', context,
            duration: 4, gravity: Toast.TOP);
      else
        Toast.show('Error in signing up', context,
            duration: 4, gravity: Toast.TOP);
    }
  }

  codeSe(String verificationId, int forceResendingToken) async {
    Navigator.of(context).pop();
    String code = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CodePage()));
    showAlertDialog(context, "Please wait...");
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      if (code == "0000") {
        Navigator.of(context).pop();
        Toast.show('Connection timed out. Try again.', context,
            duration: 4, gravity: Toast.TOP);
      } else {
        // user.user.uid;
        var user = await FirebaseAuth.instance
            .signInWithCredential(credential)
            .catchError((error, stackTrace) async {
          if (error.toString().contains(
              "The sms verification code used to create "
              "the phone auth credential is invalid. Please "
              "resend the verification code sms and be sure use the verification code provided by the user.")) {
            Toast.show(
                "The sms verification code is invalid. Send it again.", context,
                duration: 4, gravity: Toast.TOP);
          }
        });
        AppUser appu = new AppUser();
        appu.firstName = firstName.text;
        appu.lastName = lastname.text;
        appu.id = user.user.uid;
        appu.phoneNumber = "${prefixText}${phone.text}";
        await FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(user.user.uid)
            .set(appu.toMap());
        Provider.of<RoleIdentifier>(context, listen: false).setAppuser(appu);
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => BottomNavPage()));
      }
    } catch (e) {
      Navigator.of(context).pop();
      if (e.toString().contains(
          "NoSuchMethodError: The getter 'user' was called on null.")) {
      } else {
        Toast.show(
            "Please enter a valid"
            " contact number. Follow the +123 34323454 format.",
            context,
            duration: 4,
            gravity: Toast.TOP);
      }
    }
  }
}
