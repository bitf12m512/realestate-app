import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/Widgets/background.dart';
import 'package:realestate/Widgets/big_button.dart';
import 'package:realestate/Widgets/passwoed_field.dart';
import 'package:realestate/Widgets/text_field.dart';
import 'package:realestate/auth/code_page.dart';
import 'package:realestate/auth/forgot_pasword_page.dart';
import 'package:realestate/auth/sign_up_page.dart';
import 'package:realestate/bottom_nav_page/bottom_navigation_bar_page.dart';
import 'package:toast/toast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
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
                        // PasswordFieldBox(context, true, Icons.lock, "Password",
                        //     true, password, TextInputType.phone, 14),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // InkWell(
                        //  onTap: (){
                        //    Navigator.of(context).push(
                        //        MaterialPageRoute(
                        //            builder: (context) =>
                        //                ForgotPassWordPage()));
                        //  },
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: CustomText(
                        //       text: "Forgot your password?",
                        //       fontWeight: FontWeight.w600,
                        //       size: 14,
                        //       color: Colors.black.withOpacity(0.5),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 6),
                          child: bigButton(context, "Sign in", () {
                            if (_formKey.currentState.validate()) {
                              handelOTPSignup();
                            }

                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             BottomNavPage()));
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             CodePage()));
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
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> handelOTPSignup() async {
    String imgurl = "";
    showAlertDialog(context, "Please Wait...");
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone.text,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) {},
          verificationFailed: (FirebaseAuthException authException) {
            Navigator.of(context).pop();
            print(authException);
            print("......");
            if(authException.toString().contains("We have blocked all requests from this device due to unusual activity. Try again later.")){
              Toast.show(
                  "We have blocked all requests from this device is blocked due to unusual activity. Try again later. ",
                  context,
                  duration: 4,
                  gravity: Toast.TOP);
            }
            else{
              Toast.show(
                  "Please enter a valid"
                      " contact number. Follow the +123 34323454 format.",
                  context,
                  duration: 4,
                  gravity: Toast.TOP);
            }

            // Toast.show(authException.message, context,
            //     duration: 4, gravity: Toast.TOP);
          },
          codeSent: codeSe,
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      Navigator.of(context).pop();
      print(e.toString());
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
    String code = await
    Navigator.of(context)
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
        print("fine ti;; now...................loploplklkloplkoplkolpolk");
        var user = await FirebaseAuth.instance
            .signInWithCredential(credential)
            .catchError((error, stackTrace) {
          if (error.toString().contains(
              "The sms verification code used to create "
                  "the phone auth credential is invalid. Please "
                  "resend the verification code sms and be sure use the verification code provided by the user.")) {
            Toast.show(
                "The sms verification code is invalid. Send it again.", context,
                duration: 4, gravity: Toast.TOP);
          }
        });
        print("all good...................loploplklkloplkoplkolpolk");
        // await FirebaseDatabase.instance.reference().child("Users").child(path)
        await FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(user.user.uid)
            .once()
            .then((DataSnapshot dataSnapshot) async {
          if (dataSnapshot.value != null) {
            AppUser appUser = new AppUser();
            appUser = AppUser.fromMap(dataSnapshot.value);
            Provider.of<RoleIdentifier>(context, listen: false)
                .setAppuser(appUser);
          } else {
            AppUser appu = new AppUser();
            // appu.email = phone.text;x/
            appu.id = user.user.uid;
            appu.phoneNumber = phone.text;
            await FirebaseDatabase.instance
                .reference()
                .child("Users")
                .child(user.user.uid)
                .set(appu.toMap());
            Provider.of<RoleIdentifier>(context, listen: false)
                .setAppuser(appu);
            // Navigator.of(context).pop();
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => BottomNavigationBarPage(0)));
          }
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => BottomNavPage()));
        });
      }
    } catch (e) {
      Navigator.of(context).pop();

      if (e.toString().contains(
          "NoSuchMethodError: The getter 'user' was called on null.")) {
      } else {
        print("hub...................");
        print(e.toString());
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
