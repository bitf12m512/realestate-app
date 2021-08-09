import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';

pricefield(BuildContext context, String title, String hint,
    TextEditingController controller) {
  return Container(
    height: 30,
    width: MediaQuery.of(context).size.width / 1.1,
    child: Row(
      children: [
        // Image.asset(
        //   "Assets/priceTag.png",
        //   height: 30,
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        Container(
          height: 30,
          // width: MediaQuery
          //     .of(context)
          //     .size
          //     .width / 2,
          color: Constant.blueColor,
          child: Center(
            child: CustomText(
              text: title,
              color: Colors.white,
              size: 13,
              fontWeight: FontWeight.w500,

              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width / 2,
          decoration:
              BoxDecoration(border: Border.all(color: Constant.blueColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: 14,
                        color: Constant.blueColor,
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          // ignore: missing_return
                          return 'Field cannot be blank.';
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      // keyboardType: TextInputType.number
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12),
                        // WhitelistingTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.digitsOnly
                        // WhitelistingTextInputFormatter.digitsOnly
                      ],

                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 24, minWidth: 24),
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                                // hinttext.toLowerCase()=="Description".toLowerCase()?10:
                                0,
                            horizontal:
                                // hinttext.toLowerCase()=="Description".toLowerCase()?20:
                                0),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Constant.blueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: hint,
                        // labelText: "Property",
                        filled: true,
                        isDense: true,
                        enabled: true,
                        fillColor: Constant.appColor,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(1.0),
                          borderSide: new BorderSide(
                              color: Colors.transparent, width: 1.3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          borderSide: new BorderSide(
                              color: Colors.transparent, width: 1.3),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          borderSide: new BorderSide(
                              color: Colors.transparent, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          borderSide: new BorderSide(
                              color: Colors.transparent, width: 1.3),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                        ),
                        // focusedBorder: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder.none,
                        // disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
