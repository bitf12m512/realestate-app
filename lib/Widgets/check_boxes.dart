import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Classes/custom_text.dart';

checkboxes(BuildContext context,String img, String title, bool val, Function ontap) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: MediaQuery.of(context).size.width / 2.3,
      child: Row(
        children: [
          val == true
              ? Icon(Icons.check_box)
              : Icon(Icons.check_box_outline_blank_outlined),
          SizedBox(
            width: 3,
          ),
          SvgPicture.asset(
            img,
            height: 20,
            color: Colors.black.withOpacity(0.6),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: CustomText(
              text: title,
              color: Colors.black.withOpacity(0.7),
              size: 14,
              fontWeight: FontWeight.w600,

              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
