import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/check_boxes.dart';
import 'package:realestate/Widgets/send_button.dart';

import '../../Classes/custom_text.dart';
import '../../Constants/constants.dart';
import '../../Widgets/text_field_without_prefix.dart';

class CreatePropertyPage extends StatefulWidget {
  const CreatePropertyPage({Key key}) : super(key: key);

  @override
  _CreatePropertyPageState createState() => _CreatePropertyPageState();
}

class _CreatePropertyPageState extends State<CreatePropertyPage> {
  CarouselController _carouselController = new CarouselController();
  List images = ["Assets/homes@3x.png", "Assets/sampleb@3x.png"];
  List images2 = [
    "Assets/bed.svg",
    "Assets/bed.svg",
    "Assets/living.svg",
    "Assets/bath.svg",
    "Assets/area2.svg",
    "Assets/garage.svg"
  ];
  List titles = [
    "Bedrooms",
    "Master Bedroom",
    "Living Room",
    "Bathrooms",
    "Floors",
    "Parking Spots"
  ];
  List<int> values = [0, 0, 0, 0, 0, 0];
  List<bool> moreValues = [false, false, false, false];
  List<bool> checks = [false, false, false];
  int selectedtype = 0;
  TextEditingController description=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // currentimageindex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                // ImageViewer.showImageSlider(
                                //   images:widget.product.imageUrls,
                                //   startingPosition: currentimageinde,
                                // );
                              },
                              child: Container(
                                // height: MediaQuery.of(context).size.height/2,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: FadeInImage(
                                      placeholder: AssetImage("download.png"),
                                      image: AssetImage(
                                        i,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Center(
                      child: Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              height: 60,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constant.blueColor.withOpacity(0.6)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 10),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "Assets/camn.svg",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: "Add images",
                              color: Colors.white,
                              size: 20,
                              // fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "House in Jabriya Block 6",
                                // color: Colors.white,
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              SvgPicture.asset(
                                "Assets/editp.svg",
                                height: 25,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width / 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constant.blueColor,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Constant.blueColor,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          typeItem(context, "Rent", 0, selectedtype, () {
                            setState(() {
                              selectedtype = 0;
                            });
                          }),
                          typeItem(context, "Sale", 1, selectedtype, () {
                            setState(() {
                              selectedtype = 1;
                            });
                          }),
                          typeItem(context, "Exchange", 2, selectedtype, () {
                            setState(() {
                              selectedtype = 2;
                            });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                        thickness: 1.2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: selectItem("House"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: "Governorate",
                          color: Colors.black.withOpacity(0.7),
                          size: 15,
                          fontWeight: FontWeight.w600,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.4))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Kuwait City",
                                color: Colors.black.withOpacity(0.7),
                                size: 15,
                                fontWeight: FontWeight.w600,

                                // fontWeight: FontWeight.bold,
                              ),
                              SvgPicture.asset("Assets/arrowbut.svg",
                                  height: 11,
                                  color: Colors.black.withOpacity(0.6))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "District",
                            color: Colors.black.withOpacity(0.7),
                            size: 13,
                            fontWeight: FontWeight.w600,

                            // fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          selectItem("Choose"),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: images2.length,
                          itemBuilder: (context, index) {
                            return propertyPropertyItem(
                                images2[index], titles[index], values[index],
                                () {
                              setState(
                                () {
                                  if (values[index] != 0) {
                                    values[index] = values[index] - 1;
                                  }
                                },
                              );
                            }, () {
                              setState(
                                () {
                                  values[index] = values[index] + 1;
                                },
                              );
                            });
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          checkboxes(context,
                              "Assets/maid.svg", "Maid Room", moreValues[0],
                              () {
                            setState(() {
                              moreValues[0] = !moreValues[0];
                            });
                          }),
                          checkboxes(context,"Assets/water.svg", "Swimming Pool",
                              moreValues[1], () {
                            setState(() {
                              moreValues[1] = !moreValues[1];
                            });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          checkboxes(context,
                              "Assets/locat.svg", "Central AC", moreValues[2],
                              () {
                            setState(() {
                              moreValues[2] = !moreValues[2];
                            });
                          }),
                          checkboxes(context,"Assets/elevator.svg", "Elevator",
                              moreValues[3], () {
                            setState(() {
                              moreValues[3] = !moreValues[3];
                            });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.4))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Position of Realestate",
                                  color: Colors.black.withOpacity(0.4),
                                  size: 15,
                                  fontWeight: FontWeight.w600,

                                  // fontWeight: FontWeight.bold,
                                ),
                                SvgPicture.asset("Assets/arrowbut.svg",
                                    height: 11,
                                    color: Colors.black.withOpacity(0.6))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset("Assets/priceTag.png",height: 30,),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            // width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.4))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Center(
                                child: CustomText(
                                  text: "450 KWD",
                                  color: Colors.black.withOpacity(0.7),
                                  size: 15,
                                  fontWeight: FontWeight.w600,

                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWithDetectorBig(context,"","Description",true,description,TextInputType.text,1000,(){
                        // setState(() {
                        //   selected=2;
                        // });
                      }),
                   SizedBox(
                     height: 30,
                   ),
                   rowItem("Free Ad",checks[0],(){
                     setState(() {
                       checks[0]=!checks[0];
                     });
                   }),   rowItem("Premium ad: 3 days for 3 kwd",checks[1],(){
                     setState(() {
                       checks[1]=!checks[1];
                     });
                   }),   rowItem("Premium ad: 7 days for 5 kwd",checks[2],(){
                     setState(() {
                       checks[2]=!checks[2];
                     });
                   }),
                      SizedBox(
                        height: 10,
                      ),
                      saveButton(context,"Upload"),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )),
    );
  }

  next(IconData icon, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.2)),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  dateItem() {
    return Container(
      height: 20,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.7))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "02",
            size: 12,
            color: Colors.black.withOpacity(0.6),
          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            size: 18,
            color: Colors.black.withOpacity(0.6),
          )
        ],
      ),
    );
  }

  typeItem(BuildContext context, String title, int current, int selected,
      Function ontap) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          current == selected
              ? Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Constant.blueColor),
                )
              : Container(),
          SizedBox(
            width: 4,
          ),
          Container(
            decoration: BoxDecoration(
                border: current == selected
                    ? Border.all(
                        color: current == selected
                            ? Constant.blueColor
                            : Colors.transparent,
                      )
                    : Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.black.withOpacity(0.4)),
                      )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: CustomText(
                text: title,
                color: current == selected
                    ? Constant.blueColor
                    : Colors.black.withOpacity(0.4),
                size: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  selectItem(String s) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: s,
              color: Colors.black.withOpacity(0.4),
              size: 13,
              // fontWeight: FontWeight.bold,
            ),
            SvgPicture.asset("Assets/arrowbut.svg",
                height: 11, color: Colors.black.withOpacity(0.5))
          ],
        ),
      ),
    );
  }

  Widget propertyPropertyItem(
      String img, String tite, int val, Function ontap1, Function ontap2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                img,
                height: 20,
                color: Colors.black.withOpacity(0.7),
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: tite,
                color: Colors.black.withOpacity(0.7),
                size: 15,
                fontWeight: FontWeight.w600,

                // fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: ontap1,
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.4))),
                  child: Center(
                    child: Icon(Icons.remove,
                        size: 21, color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              ),
              Container(
                height: 23,
                width: 46,
                child: Center(
                  child: CustomText(
                    text: val.toString(),
                    color: Constant.blueColor.withOpacity(0.9),
                    size: 20,
                    fontWeight: FontWeight.w600,

                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: ontap2,
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Constant.blueColor.withOpacity(0.7),
                  )),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Constant.blueColor.withOpacity(0.7),
                      size: 21,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  rowItem(String title,bool val,Function ontap) {
   return InkWell(
     onTap: ontap,
     child: Padding(
       padding: const EdgeInsets.only(bottom:20.0),
       child: Row(
          children: [
            Icon(val==true?Icons.check_box:Icons.check_box_outline_blank_outlined),
            SizedBox(width: 7,),
            CustomText(
              text: title,
              color: Colors.black.withOpacity(0.7),
              size: 14,
              fontWeight: FontWeight.w600,

              // fontWeight: FontWeight.bold,
            ),
          ],
        ),
     ),
   );
  }
}
