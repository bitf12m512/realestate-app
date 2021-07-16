import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/Constants/constants.dart';

Widget PasswordWithoutPrefix(
    BuildContext context,
    bool visible,
    String hinttext,
    bool enable,
    TextEditingController controller,
    TextInputType keyboardType,
    int limit,Function ontap) {
  return TextFormField(
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
    obscureText: visible,

    decoration: InputDecoration(

      suffixIconConstraints: BoxConstraints(
          minHeight: 24,
          minWidth: 24
      ),
      suffixIcon: GestureDetector(
        onTap: ontap,
        child: Icon(
          Icons.visibility_outlined,
          color: visible == true
              ? Constant.blueColor
              : Colors.black.withOpacity(0.2),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
          vertical:
          // hinttext.toLowerCase()=="Description".toLowerCase()?10:
          12,
          horizontal:
          // hinttext.toLowerCase()=="Description".toLowerCase()?20:
          10),
      // ,

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
      // focusedBorder: InputBorder.none,
      // enabledBorder: InputBorder.none,
      // errorBorder: InputBorder.none,
      // disabledBorder: InputBorder.none,
    ),
    // decoration: InputDecoration(
    //   hintStyle: TextStyle(
    //       color: Colors.black.withOpacity(0.3)
    //   ),
    //   hintText:hinttext,
    //   border: new OutlineInputBorder(
    //     borderRadius: new BorderRadius.circular(20.0),
    //     // borderSide: new BorderSide(color:Colors.black.withOpacity(0.3)),
    //     // borderSide: BorderSide(
    //     //   color: Colors.green,
    //     // ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.white),
    //     borderRadius: BorderRadius.circular(20.7),
    //   ),
    //
    //   enabledBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: Colors.white),
    //     borderRadius: BorderRadius.circular(20.7),
    //   ),
    //   // focusedBorder: InputBorder.none,
    //   // enabledBorder: InputBorder.none,
    //   errorBorder: InputBorder.none,
    //   disabledBorder: InputBorder.none,
    // ),
  );
}
