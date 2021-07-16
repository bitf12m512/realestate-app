import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/back.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/passwoed_field.dart';
import 'package:realestate/Widgets/text_field.dart';
import 'package:realestate/Widgets/text_field_without_prefix.dart';
import 'package:realestate/auth/code_page.dart';
import 'package:realestate/auth/sign_up_page.dart';

class ForgotPassWordPage extends StatefulWidget {
  const ForgotPassWordPage({Key key}) : super(key: key);

  @override
  _ForgotPassWordPageState createState() => _ForgotPassWordPageState();
}

class _ForgotPassWordPageState extends State<ForgotPassWordPage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();

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
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      back(context),
                      Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.height / 3.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // color: Colors.deepOrange
                            ),
                            child: Image.asset(
                              "Assets/forgotpass.png",
                              fit: BoxFit.contain,
                              // height: 20,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Forgot your password?",
                        fontWeight: FontWeight.w600,
                        size: 20,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Enter your registered phone no below to revice password reset instruction",
                        fontWeight: FontWeight.w400,
                        size: 14,
                        color: Colors.black.withOpacity(0.5),
                        alignemnt: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFieldWithOutPrefix(context,"" ,"Enter your phone number",
                          true, phone, TextInputType.phone, 14),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 6),
                        child: bigButton(context, "Send", () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CodePage()));

                        }),
                      ),
                      SizedBox(
                        height: 30,
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
}
