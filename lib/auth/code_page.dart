import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/back.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/passwoed_field.dart';
import 'package:realestate/Widgets/text_field.dart';
import 'package:realestate/auth/forgot_pasword_page.dart';
import 'package:realestate/auth/sign_up_page.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key key}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController pincode = new TextEditingController();
  GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
Timer t;
@override
  void initState() {
    // TODO: implement initState
  setTimer();
    super.initState();
  }
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      back(context),
                      CustomText(
                        text: "Verify Phone",
                        fontWeight: FontWeight.w700,
                        size: 22,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPassWordPage()));
                        },
                        child: CustomText(
                          text: "Code is sent to +232222323222",
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _globalKey,
                        child: Center(
                          child: PinCodeTextField(
                            controller: pincode,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Constant.backgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            // obscureText: true,
                            // obscuringCharacter: '*',
                            // blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v.length < 6) {
                                return "Invalid Digits";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor:
                                  Constant.backgroundColor.withOpacity(0.06),
                              selectedFillColor:
                                  Constant.backgroundColor.withOpacity(0.06),
                              selectedColor:
                                  Constant.backgroundColor.withOpacity(0.06),
                              inactiveColor: Colors.transparent,
                              inactiveFillColor:
                                  Constant.backgroundColor.withOpacity(0.06),
                              activeColor: Colors.transparent,
                              //     // hasError ? Colors.whit :
                              //     Colors.white.withOpacity(0.3),
                            ),
                            cursorColor:
                                Constant.backgroundColor.withOpacity(0.5),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            enableActiveFill: true,
                            textStyle: TextStyle(
                              color: Constant.backgroundColor,
                            ),
                            // errorAnimationController: errorController,
                            // controller: textEditingController,
                            keyboardType: TextInputType.number,
                            // boxShadows: [
                            //   BoxShadow(
                            //     offset: Offset(0, 1),
                            //     color: Colors.black12,
                            //     blurRadius: 10,
                            //   )
                            // ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onTap: () {
                              print("Pressed");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                // currentText =currentText value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // TextField(
                      //     maxLines: 1,
                      //     decoration: InputDecoration(
                      //       // lableText:"Full name",
                      //       // hintText: 'Full name',
                      //      labelText: "full name",
                      //       border: OutlineInputBorder(),
                      //     )),

                      // SizedBox(
                      //   height: 30,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     // if(_globalKey.currentState.validate()){
                      //     //   t.cancel();
                      //     //   Navigator.pop(context,pincode.text);
                      //     // }
                      //     // Navigator.of(context).push(MaterialPageRoute(
                      //     //     builder: (context) => SignUpPage()));
                      //   },
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           CustomText(
                      //             text: "Didn't recive code?",
                      //             fontWeight: FontWeight.w600,
                      //             size: 16,
                      //             color: Colors.black.withOpacity(0.5),
                      //           ),
                      //           CustomText(
                      //             text: "Request again",
                      //             fontWeight: FontWeight.w700,
                      //             size: 16,
                      //             color: Colors.black,
                      //           ),
                      //         ],
                      //       ),
                      //       CustomText(
                      //         text: "Get Via Call",
                      //         fontWeight: FontWeight.w700,
                      //         size: 16,
                      //         height: 1.4,
                      //         color: Colors.black,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 6),
                        child: bigButton2(context, "Verify", () {
                          if(_globalKey.currentState.validate()){
                            t.cancel();
                            Navigator.pop(context,pincode.text);
                          }
                        }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void setTimer() {
    t=
        Timer(Duration(seconds:28),(){
          Navigator.pop(context,"0000");
        });
  }
}
