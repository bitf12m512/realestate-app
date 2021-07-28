import 'package:flutter/material.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';

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
roundedAppBarwithBack(BuildContext context,String s) {
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
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.white,)))
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
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.white,))) ,
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: ontap,
                    child: CustomText(
                      text: "Edit   ",
                      color: color,
                      size: 22,
                    )))
          ],
        ),
      ),
      ),
    // ),
  );
}