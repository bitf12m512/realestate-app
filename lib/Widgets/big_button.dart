import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
Widget bigButton(BuildContext context,String title,Function ontap){
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: MediaQuery.of(context).size.height / 16,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Constant.blueColor,
        border: Border.all(color: Constant.darkblue.withOpacity(0.2),width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w800,
          size: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}
Widget bigButton2(BuildContext context,String title,Function ontap){
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: MediaQuery.of(context).size.height / 16,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constant.blueColor,
        border: Border.all(color: Constant.darkblue.withOpacity(0.2),width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w800,
          size: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}