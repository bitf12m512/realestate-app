import 'package:flutter/material.dart';

import '../Classes/custom_text.dart';
filterMainType(BuildContext context,String title,bool val,Function ontap) {

  return  InkWell(
    onTap: ontap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: val==true?Colors.white:Colors.white.withOpacity(0.6),
          fontWeight: FontWeight.w600,
          size: 26,
        ),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: val==true?Colors.white:Colors.transparent,
          ),
        )

      ],
    ),
  );
}