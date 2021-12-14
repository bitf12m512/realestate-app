import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
Widget TextFieldBox(BuildContext context,IconData icon,String hinttext,bool enable,TextEditingController controller, TextInputType keyboardType,int limit){
  return AutoDirection(
    text: controller.text,
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
      validator: (String value) {
        if (value.isEmpty) {
          // ignore: missing_return
          return 'Field cannot be blank.';
        }
      },
      textAlignVertical: TextAlignVertical.center,
      maxLines: hinttext.toLowerCase()=="Description".toLowerCase() || hinttext.toLowerCase()=="Comment".toLowerCase()?8:1,
      keyboardType: keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(limit),
        ],

        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(
              minHeight: 24,
              minWidth: 24
          ),
         prefixIcon:
         Padding(
           padding: const EdgeInsets.only(left:5.0),
           child: Icon(icon,color: Constant.blueColor,size: 18,),
         ),
        contentPadding:
        EdgeInsets.symmetric(

            vertical:
            // hinttext.toLowerCase()=="Description".toLowerCase()?10:
            10,
            horizontal:
            // hinttext.toLowerCase()=="Description".toLowerCase()?20:
            10),
        labelStyle: TextStyle(
            color: Constant.blueColor, fontSize: 16),
        // hintText: hinttext,
        labelText: hinttext,
        filled: true,
        // isDense: true,
        enabled: enable,
        fillColor: Constant.appColor,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(1.0),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Constant.blueColor),      ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2)),      ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2)),      ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1,color:Constant.appColor.withOpacity(0.5)),
        ),
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
      // decoration: InputDecoration(
      //   hintStyle: TextStyle(
      //       color: Colors.black.withOpacity(0.3)
      //   ),
      //   hintText:hinttext,
      //   border: new OutlineInputBorder(
      //     borderRadius: new BorderRadius.circular(20.0),
      //     // borderSide: new BorderSide(color:Colors.black.withOpacity(0.3)),
      //     // borderSide: BorderSide(
      //     //   color: Colors.green,
      //     // ),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //   // focusedBorder: InputBorder.none,
      //   // enabledBorder: InputBorder.none,
      //   errorBorder: InputBorder.none,
      //   disabledBorder: InputBorder.none,
      // ),
    ),
  );
}
Widget TextFieldBoxSmall(BuildContext context,IconData icon,String hinttext,bool enable,TextEditingController controller, TextInputType keyboardType,int limit){
  return AutoDirection(
    text:controller.text ,
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      validator: (String value) {
        if (value.isEmpty) {
          // ignore: missing_return
          return 'Field cannot be blank.';
        } else if(hinttext.contains("Email Address")){
          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
         if(emailValid==false){
           return 'Enter a valid email e.g. ab@cd.com';
         }

          // return value.isValidEmail() ? null : "Enter a valid email e.g. ab@cd.com";
        }
      },
      textAlignVertical: TextAlignVertical.center,
      maxLines: hinttext.toLowerCase()=="Description".toLowerCase() || hinttext.toLowerCase()=="Comment".toLowerCase()?8:1,
      keyboardType: keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(limit),
        ],

        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(
              minHeight: 24,
              minWidth: 24
          ),
         prefixIcon:
        'Profile'.tr()=="Profile"? Padding(
           padding: const EdgeInsets.only(left:5.0,right: 0),
           child: Icon(icon,color: Constant.blueColor,size: 24,),
         ):Padding(
          padding: const EdgeInsets.only(left:0.0,right: 5),
          child: Icon(icon,color: Constant.blueColor,size: 24,),
        ),
        contentPadding:
        EdgeInsets.symmetric(

            vertical:
            // hinttext.toLowerCase()=="Description".toLowerCase()?10:
            12,
            horizontal:
            // hinttext.toLowerCase()=="Description".toLowerCase()?20:
            10),
        labelStyle: TextStyle(color: Constant.blueColor, fontSize: 14),
        // hintText: hinttext,
        labelText: hinttext,
        filled: true,
        isDense: true,
        enabled: enable,
        fillColor: Constant.appColor,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(1.0),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2),width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Constant.blueColor,width: 1.3),      ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2),width: 1.3),      ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: new BorderSide(color:Colors.black.withOpacity(0.2),width: 1.3),      ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1,color:Constant.appColor.withOpacity(0.5)),
        ),
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
      // decoration: InputDecoration(
      //   hintStyle: TextStyle(
      //       color: Colors.black.withOpacity(0.3)
      //   ),
      //   hintText:hinttext,
      //   border: new OutlineInputBorder(
      //     borderRadius: new BorderRadius.circular(20.0),
      //     // borderSide: new BorderSide(color:Colors.black.withOpacity(0.3)),
      //     // borderSide: BorderSide(
      //     //   color: Colors.green,
      //     // ),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //   // focusedBorder: InputBorder.none,
      //   // enabledBorder: InputBorder.none,
      //   errorBorder: InputBorder.none,
      //   disabledBorder: InputBorder.none,
      // ),
    ),
  );
}

// Using the RegExp from the answers by Eric and Justin,
//     I made a extension method for String:

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}