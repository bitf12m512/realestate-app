import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/Constants/constants.dart';

Widget TextFieldWithOutPrefix(
    BuildContext context,
    String prefixText,
    String hinttext,
    bool enable,
    TextEditingController controller,
    TextInputType keyboardType,
    int limit) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
    validator: (String value) {
      if (value.isEmpty && hinttext!= "Address 2") {
        // ignore: missing_return
        return 'Field cannot be blank.';
      }
    },
    textAlignVertical: TextAlignVertical.center,
    maxLines: hinttext.toLowerCase() == "Description".toLowerCase() ||
            hinttext.toLowerCase() == "Comment".toLowerCase()
        ? 8
        : 1,
    keyboardType: keyboardType,
    inputFormatters: [
      LengthLimitingTextInputFormatter(limit),
    ],

    decoration: InputDecoration(
      prefixText: prefixText,
      prefixStyle:
          TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      contentPadding: EdgeInsets.symmetric(
          vertical:
              // hinttext.toLowerCase()=="Description".toLowerCase()?10:
              12,
          horizontal:
              // hinttext.toLowerCase()=="Description".toLowerCase()?20:
              10),
      labelStyle: TextStyle(color: Constant.blueColor, fontSize: 14),
      // hintText: hinttext,
      labelText: hinttext,
      filled: true,
      isDense: true,
      enabled: enable,
      fillColor: Constant.appColor,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(1.0),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Constant.blueColor,width: 1.3),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide:
            BorderSide(width: 1, color: Constant.appColor.withOpacity(0.5)),
      ),

    ),
  );
}
Widget TextFieldWithSubmission(
    BuildContext context,
    String prefixText,
    String hinttext,
    bool enable,
    TextEditingController controller,
    TextInputType keyboardType,
    int limit,Function onsub) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
    validator: (String value) {
      if (value.isEmpty) {
        // ignore: missing_return
        return 'Field cannot be blank.';
      }
    },
    onChanged: onsub,
    textAlignVertical: TextAlignVertical.center,
    maxLines: hinttext.toLowerCase() == "Description".toLowerCase() ||
            hinttext.toLowerCase() == "Comment".toLowerCase()
        ? 8
        : 1,
    keyboardType: keyboardType,
    inputFormatters: [
      LengthLimitingTextInputFormatter(limit),
    ],

    decoration: InputDecoration(
      prefixText: prefixText,
      prefixStyle:
          TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      contentPadding: EdgeInsets.symmetric(
          vertical:
              // hinttext.toLowerCase()=="Description".toLowerCase()?10:
              12,
          horizontal:
              // hinttext.toLowerCase()=="Description".toLowerCase()?20:
              10),
      labelStyle: TextStyle(color: Constant.blueColor, fontSize: 14),
      // hintText: hinttext,
      labelText: hinttext,
      filled: true,
      isDense: true,
      enabled: enable,
      fillColor: Constant.appColor,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(1.0),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Constant.blueColor,width: 1.3),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2),width: 1.3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide:
            BorderSide(width: 1, color: Constant.appColor.withOpacity(0.5)),
      ),

    ),
  );
}

Widget TextFieldWithDetector(
    BuildContext context,
    String prefixText,
    String hinttext,
    bool enable,
    TextEditingController controller,
    TextInputType keyboardType,
    int limit,
    Function ontap) {
  return TextFormField(
    onTap: ontap,
    controller: controller,
    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
    validator: (String value) {
      if (value.isEmpty) {
        // ignore: missing_return
        return 'Field cannot be blank.';
      }
    },
    textAlignVertical: TextAlignVertical.center,
    maxLines: hinttext.toLowerCase() == "Description".toLowerCase() ||
            hinttext.toLowerCase() == "Comment".toLowerCase()
        ? 8
        : 1,
    keyboardType: keyboardType,
    inputFormatters: [
      LengthLimitingTextInputFormatter(limit),
    ],

    decoration: InputDecoration(
      prefixText: prefixText,
      prefixStyle:
          TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      contentPadding: EdgeInsets.symmetric(
          vertical:
              // hinttext.toLowerCase()=="Description".toLowerCase()?10:
              12,
          horizontal:
              // hinttext.toLowerCase()=="Description".toLowerCase()?20:
              10),
      labelStyle: TextStyle(color: Constant.blueColor, fontSize: 14),
      // hintText: hinttext,
      labelText: hinttext,
      filled: true,
      isDense: true,
      enabled: enable,
      fillColor: Constant.appColor,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(1.0),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Constant.blueColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        borderSide:
            BorderSide(width: 1, color: Constant.appColor.withOpacity(0.5)),
      ),
    )
  );
}

Widget TextFieldWithDetectorBig(
    BuildContext context,
    String prefixText,
    String hinttext,
    bool enable,
    TextEditingController controller,
    TextInputType keyboardType,
    int limit,
    Function ontap) {
  return TextFormField(
    onTap: ontap,
    controller: controller,
    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
    validator: (String value) {
      if (value.isEmpty) {
        // ignore: missing_return
        return 'Field cannot be blank.';
      }
    },
    textAlign: TextAlign.start,
    //
    textAlignVertical: TextAlignVertical.top,
    maxLines: hinttext.toLowerCase() == "Description".toLowerCase() ||
            hinttext.toLowerCase() == "Comment".toLowerCase()
        ? 8
        : 1,
    keyboardType: keyboardType,
    inputFormatters: [
      LengthLimitingTextInputFormatter(limit),
    ],

    decoration: InputDecoration(
      prefixText: prefixText,
      prefixStyle:
          TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      contentPadding: EdgeInsets.symmetric(
          vertical:
              // hinttext.toLowerCase()=="Description".toLowerCase()?10:
              12,
          horizontal:
              // hinttext.toLowerCase()=="Description".toLowerCase()?20:
              10),
      labelStyle: TextStyle(
        color: Constant.blueColor,
        fontSize: 14,
      ),
      // hintText: hinttext,
      labelText: hinttext,
      alignLabelWithHint: true,
      filled: true,
      isDense: true,
      enabled: enable,
      fillColor: Constant.appColor,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: new BorderSide(color: Constant.blueColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: new BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(width: 1, color: Constant.appColor.withOpacity(0.5)),
      ),
    ),
  );
}
