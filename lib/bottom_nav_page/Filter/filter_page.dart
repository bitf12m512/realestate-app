import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Widgets/check_boxes.dart';
import 'package:realestate/Widgets/filter_main_type.dart';
import 'package:realestate/Widgets/send_button.dart';

import '../../Classes/custom_text.dart';
import '../../Constants/constants.dart';
import '../../Constants/constants.dart';
import '../../Widgets/text_field_without_prefix.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  CarouselController _carouselController = new CarouselController();
  List images = ["Assets/homes@3x.png", "Assets/sampleb@3x.png"];
  String mainType = "buy";
  int mainCat = 0;
  int subCat = 0;
  List<int> propertyPropertiesQuantity = [0, 2, 1, 2];
  List headings = ["Bedrooms", "Master Rooms", "Bathrooms", "Parking Spots"];
  TextEditingController fromPrice = new TextEditingController();
  TextEditingController fromArea = new TextEditingController();
  TextEditingController toArea = new TextEditingController();
  TextEditingController toPrice = new TextEditingController();

  // RangeValues _currentRangeValues = const RangeValues(10, 80);
  RangeValues _currentRangeValues = const RangeValues(10, 80);
  RangeValues _currentAreaValues = const RangeValues(10, 800);
  List<bool> moreValues = [false, false, false, false];
  List cats = [
    "Apartments",
    "Condos",
    "Studio Apartments",
    "Farms",
    "Offices",
    "Storage",
    "Recreational",
    "Houses"
  ];
  List catsImages = [
    "Assets/appartment.svg",
    "Assets/studio.svg",
    "Assets/flats.svg",
    "Assets/homeicon.svg",
    "Assets/appartment.svg",
    "Assets/studio.svg",
    "Assets/flats.svg",
    "Assets/homeicon.svg",
  ];
  List subCats = ["All", "House", "Flats", "Room", "Hotel"];

  List subCatsImages = [
    "Assets/S1.svg",
    "Assets/S2.svg",
    "Assets/S3.svg",
    "Assets/S4.svg",
    "Assets/S5.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
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
                      child: Image.asset(
                        "Assets/filterBack.png",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              ),
                              CustomText(
                                text: "Filter",
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                size: 20,
                              ),
                              SvgPicture.asset(
                                "Assets/sharen.svg",
                                height: 30,
                                color: Colors.transparent,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                filterMainType(context, "Buy",
                                    mainType == "buy" ? true : false, () {
                                  setState(() {
                                    mainType = "buy";
                                  });
                                }),
                                filterMainType(context, "Rent",
                                    mainType == "rent" ? true : false, () {
                                  setState(() {
                                    mainType = "rent";
                                  });
                                })
                                ,filterMainType(context, "Exchange",
                                    mainType == "exchange" ? true : false, () {
                                  setState(() {
                                    mainType = "exchange";
                                  });
                                }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          topWidget(),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.4),
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          head("Price Range"),
                          mainCats(),
                          subcats(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              head("Price Range"),
                              dropDownWidget("KWD")
                            ],
                          ),
                          RangeSlider(
                            values: _currentRangeValues,
                            min: 0,
                            max: 2000,
                            divisions: 10,
                            inactiveColor: Constant.darkblue.withOpacity(0.3),
                            activeColor: Constant.blueColor,
                            labels: RangeLabels(
                              "Rs${_currentRangeValues.start.round().toString()}K",
                              "Rs${_currentRangeValues.end.round().toString()}K",
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                fromPrice.text = values.start.toString();
                                toPrice.text = values.end.toString();
                                _currentRangeValues = values;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "From",
                                      false,
                                      fromPrice,
                                      TextInputType.number,
                                      10, (val) {
                                setState(() {
                                  _currentRangeValues = RangeValues(
                                    double.parse(val),
                                    _currentRangeValues.end,
                                  );
                                });
                              })),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: head("to"),
                              ),
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "To",
                                      true,
                                      toPrice,
                                      TextInputType.number,
                                      10, (val) {
                                _currentRangeValues = RangeValues(
                                  _currentRangeValues.start,
                                  double.parse(val),
                                );
                              })),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              head("Area Range"),
                              dropDownWidget("Sqr. ft.")
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "From",
                                      false,
                                      fromArea,
                                      TextInputType.number,
                                      10, (val) {
                                setState(() {
                                  _currentAreaValues = RangeValues(
                                    double.parse(val),
                                    _currentAreaValues.end,
                                  );
                                });
                              })),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: head("to"),
                              ),
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "To",
                                      true,
                                      toArea,
                                      TextInputType.number,
                                      10, (val) {
                                _currentAreaValues = RangeValues(
                                  _currentAreaValues.start,
                                  double.parse(val),
                                );
                              })),
                            ],
                          ),
                          RangeSlider(
                            values: _currentAreaValues,
                            min: 0,
                            max: 8000,
                            divisions: 10,
                            inactiveColor: Constant.darkblue.withOpacity(0.3),
                            activeColor: Constant.blueColor,
                            labels: RangeLabels(
                              "${_currentAreaValues.start.round().toString()}Sqr. ft.",
                              "${_currentAreaValues.end.round().toString()}Sqr. ft.",
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                // startprice.text = values.start.toString();
                                // endprice.text = values.end.toString();
                                _currentAreaValues = values;
                              });
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: propertyPropertiesQuantity.length,
                              itemBuilder: (context, index) {
                                return increDec(
                                    context,
                                    headings[index],
                                    propertyPropertiesQuantity[index],
                                    () {
                                      setState(() {
                                        if(propertyPropertiesQuantity[index]!=0){
                                          propertyPropertiesQuantity[index]=propertyPropertiesQuantity[index]-1;
                                        }
                                      });
                                    },
                                    () {
                                      setState(() {
                                        propertyPropertiesQuantity[index]=propertyPropertiesQuantity[index]+1;
                                      });
                                    });
                              }),
                          checkBoxesWidget(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: "Reset",
                                fontWeight: FontWeight.w800,
                                size: 17,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              saveButton(context, "Search",(){

                              })
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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

  subcats() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subCatsImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    subCat = index;
                  });
                },
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      boxShadow: [
                        subCat == index
                            ? BoxShadow(
                                color: Colors.black.withOpacity(0.001),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              )
                            : BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: subCat == index
                            ? Constant.blueColor.withOpacity(0.3)
                            : Colors.black.withOpacity(0.08),
                        border: Border.all(
                            color: subCat == index
                                ? Constant.blueColor.withOpacity(0.8)
                                : Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            subCatsImages[index],
                            height: 16,
                            color: subCat == index
                                ? Constant.blueColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: subCats[index],
                            size: 12,
                            color: subCat == index
                                ? Constant.blueColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  mainCats() {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cats.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainCat = index;
                  });
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainCat == index
                          ? Constant.blueColor.withOpacity(0.2)
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.height / 15,
                            child: SvgPicture.asset(
                              catsImages[index],
                              color: mainCat == index
                                  ? Constant.blueColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.2),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: cats[index],
                          size: 12,
                          color: mainCat == index
                              ? Constant.blueColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  checkBoxesWidget() {
    return Column(
      children: [
        Row(
          children: [
            checkboxes(context, "Assets/maid.svg", "Maid Room", moreValues[0],
                () {
              setState(() {
                moreValues[0] = !moreValues[0];
              });
            }),
            checkboxes(
                context, "Assets/water.svg", "Swimming Pool", moreValues[1],
                () {
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
            checkboxes(context, "Assets/locat.svg", "Central AC", moreValues[2],
                () {
              setState(() {
                moreValues[2] = !moreValues[2];
              });
            }),
            checkboxes(
                context, "Assets/elevator.svg", "Elevator", moreValues[3], () {
              setState(() {
                moreValues[3] = !moreValues[3];
              });
            }),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.black.withOpacity(0.4),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "City",
                  size: 16,
                  color: Colors.black.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "Ali Ahmad",
                  size: 12,
                  color: Constant.blueColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: Colors.black.withOpacity(0.3),
        )
      ],
    );
  }

  dropDownWidget(String title) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(border: Border.all(color: Constant.blueColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              color: Colors.black.withOpacity(0.4),
              size: 13,
              fontWeight: FontWeight.w600,

              // fontWeight: FontWeight.bold,
            ),
            SvgPicture.asset("Assets/arrowbut.svg",
                height: 9, color: Colors.black.withOpacity(0.6))
          ],
        ),
      ),
    );
  }

  head(String s) {
    return CustomText(
      text: s,
      size: 19,
      color: Colors.black.withOpacity(0.9),
      fontWeight: FontWeight.w500,
    );
  }

  increDec(BuildContext context, String title, int val, Function ontap1,
      Function ontap2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        head(title),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  color: Colors.black.withOpacity(0.6),
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
                  color: Colors.black.withOpacity(0.6),
                )),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(0.7),
                    size: 21,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.black.withOpacity(0.4),
          thickness: 1.2,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
