import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
class MyAddsPage extends StatefulWidget {
  const MyAddsPage({Key key}) : super(key: key);

  @override
  _MyAddsPageState createState() => _MyAddsPageState();
}

class _MyAddsPageState extends State<MyAddsPage> {
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            roundedAppBarwithBack(context,"My Ads"),
            Row(
              children: [
               typeItem("Published",0,selected,(){
                 setState(() {
                   selected=0;
                 });
               }) ,
                typeItem("Pendding",1,selected,(){
                 setState(() {
                   selected=1;
                 });
               })
              ],
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 10,top: 10),
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                    // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 5,
                                        width: MediaQuery.of(context).size.width/3,
                                        child: Container(
                                          height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                          width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                topLeft: Radius.circular(15)),
                                            child: Image.asset(
                                              "Assets/homes@3x.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CustomText(
                                                text: "House in Jabriya Block 6",
                                                color: Colors.black,
                                                size: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Container(
                                                height: 3,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Constant.blueColor,
                                                ),
                                              ),
                                              Container(
                                                height: 1,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2,
                                                color: Constant.blueColor,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      favBedItem("Bedrooms", "   03",
                                                          "Assets/bed.svg"),
                                                      favBedItem("Bathrooms", "   04",
                                                          "Assets/bath.svg"),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: CustomText(
                                                      text: "8 hours age",
                                                      color: Colors.black.withOpacity(0.4),
                                                      size:8,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      favBedItem("Living Rooms", "   12",
                                                          "Assets/living.svg"),
                                                      favBedItem("Garage", "   01",
                                                          "Assets/garage.svg"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(""),
                                                      CustomText(
                                                        text: " 450 KWD",
                                                        color: Constant.blueColor,
                                                        size: 12,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset("Assets/editp.svg",height: 16,)),
                                )
                              ],
                            ),
                          ),
                        ) ;
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  typeItem(String title,int current,int selected,Function ontap) {
    return  Padding(
      padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
      child: GestureDetector(
        onTap: ontap,
        child: AnimatedContainer(
          duration: new Duration (seconds: 1),
          height:current==selected? 35:30,
          width: current==selected?MediaQuery.of(context).size.width/3.8:MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: current==selected?Constant.blueColor:Colors.grey.withOpacity(0.3),
              border: Border.all(color: current==selected?Constant.darkblue.withOpacity(0.8):Colors.black.withOpacity(0.3),
              )
          ),
          child: Center(
            child: CustomText(
              text:title,
              color:current==selected? Constant.darkblue:Colors.black.withOpacity(0.3),
              size: current==selected?16:14,
            ),
          ),
        ),
      ),
    );
  }


}
