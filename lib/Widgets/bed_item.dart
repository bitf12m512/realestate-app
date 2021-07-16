import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';

bedItem(String title, String val, String image) {
  return Container(
    height: 40,
    width: 130,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Colors.black.withOpacity(0.3),
          size: 10,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: 20,
            ),
            CustomText(
              text: val,
              color: Colors.black.withOpacity(0.7),
              size: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    ),
  );
}

favBedItem(String title, String val, String image) {
  return Container(
    height: 40,
    width: 65,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Colors.black.withOpacity(0.3),
          size: 8,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: 18,
            ),
            CustomText(
              text: val,
              color: Colors.black.withOpacity(0.7),
              size: 10,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    ),
  );
}
detailBedItem(String title, String val, String image) {
  return Container(
    height: 60,
    width: 120,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Colors.black.withOpacity(0.3),
          size: 12,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: 22,
              color: Constant.darkblue.withOpacity(0.8),
            ),
            CustomText(
              text: val,
              color: Constant.darkblue.withOpacity(0.8),
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    ),
  );
}