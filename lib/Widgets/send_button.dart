import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Classes/custom_text.dart';
import '../Constants/constants.dart';
sendButton(BuildContext context)
{
  return   Center(
    child: Container(
      height: MediaQuery.of(context)
          .size
          .height /
          22,
      width: MediaQuery.of(context)
          .size
          .width /
          3,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(10),
        color: Constant.blueColor,
        border: Border.all(
            color: Constant.darkblue
                .withOpacity(0.2),
            width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0,
                1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "Assets/sendt.svg",
            height: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          CustomText(
            text: "Send",
            fontWeight:
            FontWeight.w800,
            size: 14,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
saveButton(BuildContext context,String text,Function ontap)
{
  return   Center(
    child: GestureDetector(
      onTap:ontap,
      child: Container(
        height: MediaQuery.of(context)
            .size
            .height /
            20,
        width: MediaQuery.of(context)
            .size
            .width /
            2.8,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          color: Constant.blueColor,
          border: Border.all(
              color: Constant.darkblue
                  .withOpacity(0.2),
              width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0,
                  1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontWeight:
            FontWeight.w800,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}