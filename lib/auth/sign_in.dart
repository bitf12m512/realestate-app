import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/passwoed_field.dart';
import 'package:realestate/Widgets/text_field.dart';
import 'package:realestate/auth/forgot_pasword_page.dart';
import 'package:realestate/auth/sign_up_page.dart';
import 'package:realestate/bottom_nav_page/bottom_navigation_bar_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                        text: "Sign in",
                        fontWeight: FontWeight.w800,
                        size: 30,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFieldBox(context, Icons.call, "Phone No", true, phone,
                          TextInputType.phone, 14),
                      SizedBox(
                        height: 30,
                      ),
                      PasswordFieldBox(context, true, Icons.lock, "Password",
                          true, password, TextInputType.phone, 14),
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
                      InkWell(
                       onTap: (){

                         Navigator.of(context).push(
                             MaterialPageRoute(
                                 builder: (context) =>
                                     ForgotPassWordPage()));
                       },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomText(
                            text: "Forgot your password?",
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 6),
                        child: bigButton(context, "Sign in", () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavPage()));

                        }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Don't have an account?",
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            CustomText(
                              text: "Sign up",
                              fontWeight: FontWeight.w700,
                              size: 14,
                              color: Constant.darkblue,
                            ),
                          ],
                        ),
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
}
