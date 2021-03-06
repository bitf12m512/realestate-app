import 'package:flutter/material.dart';
import 'package:realestate/Constants/constants.dart';

import '../Classes/custom_text.dart';
filterMainType(BuildContext context,String title,bool val,Function ontap) {

  return  InkWell(
    onTap: ontap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: val==true?Constant.blueColor.withOpacity(0.7):Colors.black.withOpacity(0.2),
          fontWeight: FontWeight.w600,
          size: 20,
        ),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: val==true?Constant.blueColor.withOpacity(0.7):Colors.transparent,
          ),
        )

      ],
    ),
  );
}