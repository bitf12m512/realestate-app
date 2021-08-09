import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
Widget noPropertyFoundWidget(BuildContext context,String title){
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("Assets/box.svg",
              height: 100,
              color: Colors.black.withOpacity(0.7)),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text:title,
            size: 16,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
    ),
  );
}