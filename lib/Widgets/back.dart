import 'package:flutter/material.dart';
import 'package:realestate/Constants/constants.dart';
back(BuildContext context){
 return GestureDetector(
    onTap: (){
      Navigator.of(context).pop();
    },
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.arrow_back_ios,size: 35,color: Constant.blueColor,)),
  );
}