import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
imageSelectionOption(BuildContext context,Function ontap1,Function ontap2) {
  TextStyle style = TextStyle(
      color: Colors.black,
      fontSize: MediaQuery.of(context).size.height / 50);
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            "selectOption".tr(),
            style:
            TextStyle(fontSize: MediaQuery.of(context).size.height / 40),
          ),
          actions: [
            FlatButton(
                child: Text(
                  'Camera'.tr(),
                  style: style,
                ),
                onPressed:ontap1),
            TextButton(
                child: Text(
                  'Gallery'.tr(),
                  style: style,
                ),
                onPressed: ontap2)
          ],
        );
      });
}