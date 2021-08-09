import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
Widget dropDownWidget(BuildContext context,String title,String val,List<DropdownMenuItem<String>> values,Function onvalue){
  return  Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: CustomText(
          text: title,
          color: Colors.black.withOpacity(0.7),
          size: 15,
          fontWeight: FontWeight.w600,

          // fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 38,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Constant.blueColor.withOpacity(0.9)
        ),
        child: DropdownBelow(
          itemWidth: 300,
          itemTextstyle: TextStyle(
              fontSize:  16.5, fontWeight: FontWeight.w400, color: Colors.black),
          boxTextstyle: TextStyle(
              fontSize:  16.5, fontWeight: FontWeight.w400, color: Colors.white),
          boxPadding: EdgeInsets.fromLTRB(13, 1, 13, 1),
          icon:  SvgPicture.asset("Assets/arrowbut.svg",
              height: 5, color: Colors.white),
          hint: Text(''),
          value: val,
          items: values,
          onChanged: onvalue,
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}