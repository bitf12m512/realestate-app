import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/edit_property/edit_property.dart';

dropDownItem(
    BuildContext context,
    String title,
    String value,
    String placeHolder,
    List<PopupMenuEntry<dynamic>> catList,
    Function onselected) {
  return Column(
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
        height: 30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Constant.blueColor,
          // border: Border.all(
          //     color: Colors.black.withOpacity(0.4))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: value.length == 0 ? placeHolder : value,
                color: Colors.white,
                size: 16.5,
                fontWeight: FontWeight.w400,
              ),
              MyPopupMenuButton(
                popupItems: catList,
                onSelected: onselected,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
dropDownItemFilter(
    BuildContext context,
    int textSize,
    String title,
    String value,
    String placeHolder,
    List<PopupMenuEntry<dynamic>> catList,
    Function onselected) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: CustomText(
          text: title,
          size: double.parse(textSize.toString()),
          color: Colors.black.withOpacity(0.9),
          fontWeight: FontWeight.w500,

          // fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        height: 33,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Constant.blueColor,
          // border: Border.all(
          //     color: Colors.black.withOpacity(0.4))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: value.length == 0 ? placeHolder : value,
                color: Colors.white,
                size: 16.5,
                fontWeight: FontWeight.w400,
              ),
              MyPopupMenuButton(
                popupItems: catList,
                onSelected: onselected,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
