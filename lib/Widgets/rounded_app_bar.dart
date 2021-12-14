import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
roundedAppBar(BuildContext context,String s) {
  return   Container(
    // height: MediaQuery.of(context).size.height/10,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Constant.darkblue.withOpacity(0.95),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
    ),
    child: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomText(
              text:s,
              color: Colors.white,
              size: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}
roundedAppBarwithBack(BuildContext context,String s,Function ontap) {
  return   Container(
    // height: MediaQuery.of(context).size.height/10,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Constant.darkblue.withOpacity(0.95),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
    ),
    child: SafeArea(
      child: Container(
        height: 60,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text:s,
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: GestureDetector(
                      onTap:ontap,
                      child: Icon(Icons.arrow_back_ios_rounded,size: 26,color: Colors.white,)),
                ))
          ],
        ),
      ),
    ),
  );
}
roundedAppBarwithBackAndFilter(BuildContext context,String s,Function ontap,Function ontap2) {
  return   Container(
    // height: MediaQuery.of(context).size.height/10,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Constant.darkblue.withOpacity(0.95),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
    ),
    child: SafeArea(
      child: Container(
        height: 60,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text:s,
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: GestureDetector(
                      onTap:ontap,
                      child: Icon(Icons.arrow_back_ios_rounded,size: 26,color: Colors.white,)),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: GestureDetector(
                  onTap:ontap2,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context)
                        .size
                        .width /
                        4.2,
                    decoration: BoxDecoration(
                        color: Constant.blueColor,
                        borderRadius:
                        BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Filter  ",
                          size: 12,
                          color: Colors.white,
                        ),
                        SvgPicture.asset(
                          "Assets/filter.svg",
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
roundedAppBarwithBackedit(BuildContext context,String s,Function ontap,Color color) {
  return   Container(
    // height: MediaQuery.of(context).size.height/10,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Constant.darkblue.withOpacity(0.95),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
    ),
    child: SafeArea(
      child: Container(
        height: 65,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text:s,
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios_rounded,size: 26,color: Colors.white,)),
                )) ,
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: ontap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: CustomText(
                        text: "Edit".tr(),
                        color: color,
                        size: 20,
                      ),
                    )))
          ],
        ),
      ),
      ),
    // ),
  );
}