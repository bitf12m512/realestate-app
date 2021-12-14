import 'package:flutter/material.dart';
import 'package:realestate/Constants/constants.dart';
back(BuildContext context,Function ontap){
 return GestureDetector(
    onTap:ontap,
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.arrow_back_ios,size: 26,color: Constant.blueColor,)),
  );
}