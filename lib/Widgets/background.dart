import 'package:flutter/material.dart';

Widget background(BuildContext context) {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: MediaQuery.of(context).size.height / 9,
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            "Assets/backgroundPart.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     SafeArea(
      //       child: Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         child:
      //       ),
      //     )
      //   ],
      // ),
    ),
  );
}
