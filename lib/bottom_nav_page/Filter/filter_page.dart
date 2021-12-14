import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/fiter.dart';
import 'package:realestate/Widgets/check_boxes.dart';
import 'package:realestate/Widgets/dop_down_movie.dart';
import 'package:realestate/Widgets/drop_down_button.dart';
import 'package:realestate/Widgets/filter_main_type.dart';
import 'package:realestate/Widgets/send_button.dart';

import '../../Classes/custom_text.dart';
import '../../Constants/constants.dart';
import '../../Constants/constants.dart';
import '../../Widgets/text_field_without_prefix.dart';
import 'package:easy_localization/easy_localization.dart';
class FilterPage extends StatefulWidget {
  Filter filter=new Filter();
  FilterPage(this.filter); // const FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  CarouselController _carouselController = new CarouselController();
  List images = ["Assets/homes@3x.png", "Assets/sampleb@3x.png"];
  String mainType = "all";
  int mainCat = 0;
  int subCat = 0;
  List avaiableIcons = [
    "Assets/house.svg",
    "Assets/buy.svg",
    "Assets/exchange.svg",
    "Assets/all.svg"
  ];
  String selectedCategory = "All";
  String governorate = "All";
  String district = "All";
  String position =   "All";
  String positionval = "";
  List<int> propertyPropertiesQuantity = [0, 0, 0, 0];
  List headings = ["bedrooms".tr(), "materBedRoom".tr(), "bathrooms".tr(), "parkingSpots".tr()];
  TextEditingController fromPrice = new TextEditingController();
  TextEditingController fromArea = new TextEditingController();
  TextEditingController toArea = new TextEditingController();
  TextEditingController toPrice = new TextEditingController();
  List<DropdownMenuItem<String>> _popupItemSubCategories1 = [];
  List<DropdownMenuItem<String>> categories = [];
  List<DropdownMenuItem<String>> positions = [];
  List<DropdownMenuItem<String>> city = [];
  List<DropdownMenuItem<String>> Havalli = [];
  List<DropdownMenuItem<String>> Mubarak = [];
  List<DropdownMenuItem<String>> all = [];
  List<DropdownMenuItem<String>> Ahmadi = [];
  List<DropdownMenuItem<String>> Farwaniya = [];
  List<DropdownMenuItem<String>> Jahra = [];
  RangeValues _currentRangeValues = const RangeValues(10, 80);
  RangeValues _currentAreaValues = const RangeValues(10, 800);
  List<bool> moreValues = [false, false, false, false];
  List cats = [
    "All".tr(),
    "Apartments".tr(),
    "Condos".tr(),
    "Studio Apartments".tr(),
    "Farms".tr(),
    "Chalets".tr(),
    "Offices".tr(),
    "Storage".tr(),
    "Recreational".tr(),
    "Houses".tr()
  ];
  List cats2 = [
    "All",
    "Apartments",
    "Condos",
    "Studio Apartments",
    "Farms",
    "Chalets",
    "Offices",
    "Storage",
    "Recreational",
    "Houses"
  ];
  List catsImages = [
    "Assets/all.svg",
    "Assets/appartment.svg",
    "Assets/condos.svg",
    "Assets/studio.svg",
    "Assets/Farm.svg",
    "Assets/chalet.svg",
    "Assets/Office.svg",
    "Assets/Storages.svg",
    "Assets/recreational.svg",
    "Assets/homeicon.svg",
  ];
  List subCats = ["All".tr(), "House".tr(), "Flats".tr(), "Room".tr(), "Hotel".tr()];

  // List<PopupMenuEntry<dynamic>> city = [];
  // List<PopupMenuEntry<dynamic>> Havalli = [];
  // List<PopupMenuEntry<dynamic>> Mubarak = [];
  // List<PopupMenuEntry<dynamic>> All = [];
  // List<PopupMenuEntry<dynamic>> Ahmadi = [];
  // List<PopupMenuEntry<dynamic>> Farwaniya = [];
  // List<PopupMenuEntry<dynamic>> Jahra = [];
  List subCatsImages = [
    "Assets/S1.svg",
    "Assets/S2.svg",
    "Assets/S3.svg",
    "Assets/S4.svg",
    "Assets/S5.svg"
  ];
  final GlobalKey dropdownKey = GlobalKey();
  final GlobalKey dropdownKey1 = GlobalKey();
  final GlobalKey dropdownKey2 = GlobalKey();
  final GlobalKey dropdownKey3 = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _basicContent();
    super.initState();
  }

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
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
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
                        fit: BoxFit.fill,
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              CustomText(
                                text: "filter".tr(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              typeItem(context, "All", avaiableIcons[3]),
                              typeItem(context, "rent", avaiableIcons[0]),
                              typeItem(context, "buy", avaiableIcons[1]),
                              typeItem(context, "exchange", avaiableIcons[2]),
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       filterMainType(context, "Buy",
                          //           mainType == "buy" ? true : false, () {
                          //             setState(() {
                          //               mainType = "buy";
                          //             });
                          //           }),
                          //       filterMainType(context, "Rent",
                          //           mainType == "rent" ? true : false, () {
                          //             setState(() {
                          //               mainType = "rent";
                          //             });
                          //           }),
                          //       filterMainType(context, "Exchange",
                          //           mainType == "exchange" ? true : false, () {
                          //             setState(() {
                          //               mainType = "exchange";
                          //             });
                          //           }),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // topWidget(),
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
                          head("category".tr()),
                          SizedBox(
                            height: 10,
                          ),
                          // mainCats(),
                          subcats(),
                          SizedBox(
                            height: 20,
                          ),
                          dropDownWidget(
                              context,
                              dropdownKey,
                              "governorate".tr(),
                              governorate,
                              _popupItemSubCategories1, (newValue) {
                            setState(() {
                              governorate = newValue;
                              print(newValue);
                              print(newValue);
                              print(newValue);
                            });
                          }),
                          dropDownWidget(
                              context,
                              dropdownKey1,
                              "district".tr(),
                              district,
                              governorate.toLowerCase().contains("Al Asimah Governorate".toLowerCase())
                                  ? city
                                  : governorate.toLowerCase().contains("hawalli")
                                  ? Havalli
                                  : governorate
                                  .toLowerCase()
                                  .contains("jahra")
                                  ? Jahra
                                  : governorate
                                  .toLowerCase()
                                  .contains("farwaniya")
                                  ? Farwaniya
                                  : governorate
                                  .toLowerCase()
                                  .contains("mubarak")
                                  ? Mubarak
                                  : governorate
                                  .toLowerCase()
                                  .contains("all")
                                  ? all
                                  : Ahmadi,
                                  (newValue) {
                            setState(() {
                              district = newValue;
                            });
                          }),
                          dropDownWidget(
                              context,
                              dropdownKey2,
                              "position".tr(),
                              position,
                              positions, (newValue) {
                            setState(() {
                              position = newValue;
                              positionval=newValue;
                            });
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              head("priceRange".tr()),
                              dropDownWidgetSim("kwd".tr())
                            ],
                          ),
                          RangeSlider(
                            values: _currentRangeValues,
                            min: 0,
                            max: 200000,
                            divisions: 1000,
                            inactiveColor: Constant.darkblue.withOpacity(0.3),
                            activeColor: Constant.blueColor,
                            labels: RangeLabels(
                              "${_currentRangeValues.start.round().toString()}${'kwd'.tr()}",
                              "${_currentRangeValues.end.round().toString()}${'kwd'.tr()}",
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
                                      "from".tr(),
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
                                child: head("to".tr()),
                              ),
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "to2".tr(),
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
                              head("areaRange".tr()),
                              dropDownWidgetSim("sqft".tr())
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
                                      "from".tr(),
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
                                child: head("to".tr()),
                              ),
                              Expanded(
                                  child: TextFieldWithSubmission(
                                      context,
                                      "",
                                      "to2".tr(),
                                      true,
                                      toArea,
                                      TextInputType.number,
                                      10, (val) {
                                // _currentRangeValues = RangeValues(
                                //   _currentRangeValues.start,
                                //
                                //   double.parse(val),
                                // );
                                _currentAreaValues = RangeValues(
                                  _currentAreaValues.start,
                                  double.parse(val),
                                  // set
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
                              "${_currentAreaValues.start.round().toString()}${'sqft'.tr()}",
                              "${_currentAreaValues.end.round().toString()}${'sqft'.tr()}",
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                fromArea.text = values.start.toString();
                                toArea.text = values.end.toString();
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
                                return increDec(context, headings[index],
                                    propertyPropertiesQuantity[index], () {
                                  setState(() {
                                    if (propertyPropertiesQuantity[index] !=
                                        0) {
                                      propertyPropertiesQuantity[index] =
                                          propertyPropertiesQuantity[index] - 1;
                                    }
                                  });
                                }, () {
                                  setState(() {
                                    propertyPropertiesQuantity[index] =
                                        propertyPropertiesQuantity[index] + 1;
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
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    mainType = "All";
                                    selectedCategory ="all";
                                    // mainType = title.toLowerCase();
                                    mainCat = 0;
                                    subCat = 0;
                                    fromPrice.clear();
                                    toPrice.clear();
                                    fromArea.clear();
                                    toArea.clear();
                                    propertyPropertiesQuantity[0] = 0;
                                    propertyPropertiesQuantity[1] = 0;
                                    propertyPropertiesQuantity[2] = 0;
                                    propertyPropertiesQuantity[3] = 0;
                                    moreValues[0] = false;
                                    moreValues[1] = false;
                                    moreValues[2] = false;
                                    moreValues[3] = false;
                                    governorate = "All";
                                    district = 'All';
                                    position="Corner house";

                                    positionval="";
                                  });
                                },
                                child: CustomText(
                                  text: "reset".tr(),
                                  fontWeight: FontWeight.w800,
                                  size: 17,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              saveButton(context, "search".tr(), () {

                                Filter filter = new Filter();
                                filter.availableFor = mainType;
                                filter.mainCategory = cats2[mainCat];
                                filter.priceStart = fromPrice.text;
                                filter.priceEnd = toPrice.text;
                                filter.areaStart = fromArea.text;
                                filter.areaEnd = toArea.text;
                                filter.bedrooms = propertyPropertiesQuantity[0];
                                filter.masterRooms =
                                    propertyPropertiesQuantity[1];
                                filter.bathRooms =
                                    propertyPropertiesQuantity[2];
                                filter.parkingSpots =
                                    propertyPropertiesQuantity[3];
                                filter.position=positionval;
                                filter.maidRoom = moreValues[0];
                                filter.swimmingPool = moreValues[1];
                                filter.centralAC = moreValues[2];
                                filter.elevator = moreValues[3];
                                filter.district = district;
                                filter.governorate = governorate;
                                Navigator.pop(context, filter);
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
          itemCount: cats.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainCat = index;
                  });
                },
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      boxShadow: [
                        mainCat == index
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
                        color: mainCat == index
                            ? Constant.blueColor.withOpacity(0.3)
                            : Colors.black.withOpacity(0.08),
                        border: Border.all(
                            color: mainCat == index
                                ? Constant.blueColor.withOpacity(0.8)
                                : Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            catsImages[index],
                            height: 16,
                            color: mainCat == index
                                ? Constant.blueColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: cats[index],
                            size: 12,
                            color: mainCat == index
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
                          alignemnt: TextAlign.center,
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
            checkboxes(context, "Assets/maid.svg", "maidRoom".tr(), moreValues[0],
                () {
              setState(() {
                moreValues[0] = !moreValues[0];
              });
            }),
            checkboxes(
                context, "Assets/water.svg", "swimmingPool".tr(), moreValues[1],
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
            checkboxes(context, "Assets/locat.svg", "centralAc".tr(), moreValues[2],
                () {
              setState(() {
                moreValues[2] = !moreValues[2];
              });
            }),
            checkboxes(
                context, "Assets/elevator.svg", "elevator".tr(), moreValues[3], () {
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

  void _basicContent(){
    for (var i in Constant.governoratesA) {
      _popupItemSubCategories1.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.cats) {
      categories.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.AsimahA) {
      city.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    all.add(
      DropdownMenuItem(
        value: "All",
        child: Text("All").tr(),
      ),
    );
    for (var i in Constant.HavalliA) {
      Havalli.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.positions) {
      positions.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.MubarakA) {
      Mubarak.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.AhmadiA) {
      Ahmadi.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.FarwaniyaA) {
      Farwaniya.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    for (var i in Constant.JahraA) {
      Jahra.add(
        DropdownMenuItem(
          value: i,
          child: Text(i).tr(),
        ),
      );
    }
    if(widget.filter.mainCategory!=null){
      selectedCategory = widget.filter.availableFor;
      mainType = widget.filter.availableFor.toLowerCase();
    }
    if(widget.filter.mainCategory!=null){
      mainCat = cats2.indexOf(widget.filter.mainCategory);
    }
    if(widget.filter.governorate!=null){
      governorate=widget.filter.governorate;
    } if(widget.filter.district!=null){
      district=widget.filter.district;    }
    if(widget.filter.position!=null &&widget.filter.position!=""){
      position=widget.filter.position;
    }
    if(widget.filter.areaEnd!=null && widget.filter.areaEnd!=""){
      _currentAreaValues = RangeValues(
        double.parse(widget.filter.areaStart),
        double.parse(widget.filter.areaEnd),
        // _currentAreaValues.end,
      );
      fromArea.text=widget.filter.areaStart;
      toArea.text=widget.filter.areaEnd;
    }
    if(widget.filter.priceEnd!=null && widget.filter.priceEnd!=""){
      _currentRangeValues = RangeValues(
        double.parse(widget.filter.priceStart),
        double.parse(widget.filter.priceEnd),
        // _currentAreaValues.end,
      );
      fromPrice.text=widget.filter.priceStart;
      toPrice.text=widget.filter.priceEnd;
    }
    if(widget.filter.bedrooms!=null){
      propertyPropertiesQuantity[0]=widget.filter.bedrooms;
    }
    if(widget.filter.masterRooms!=null){
      propertyPropertiesQuantity[1]=widget.filter.masterRooms;
    } if(widget.filter.bathRooms!=null){
      propertyPropertiesQuantity[2]=widget.filter.bathRooms;
    } if(widget.filter.parkingSpots!=null){
      propertyPropertiesQuantity[3]=widget.filter.parkingSpots;
    }
    if(widget.filter.maidRoom!=null){
      moreValues[0]=widget.filter.maidRoom;
    }
    if(widget.filter.swimmingPool!=null){
      moreValues[1]=widget.filter.swimmingPool;
    }
    if(widget.filter.centralAC!=null){
      moreValues[2]=widget.filter.centralAC;
    }
    if(widget.filter.elevator!=null){
      moreValues[3]=widget.filter.elevator;
    }
    setState(() {});
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {});
    });
  }

  dropDownWidgetSim(String title) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.6,
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
      size: 17,
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

  Widget typeItem(BuildContext context, String title, String icon) {
    return GestureDetector(
      onTap: () {
        // var provider = Provider.of<RoleIdentifier>(context, listen: false);
        // provider.setPropertyList([]);
        // if(title=="All"){
        //   for (int i = 0; i < provider.getPropertyBackList.length; i++) {
        //     // if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
        //     //     title.toLowerCase()) {
        //     provider.addTOProprertyList(provider.getPropertyBackList[i]);
        //     // }
        //   }
        // }
        // else{
        //   for (int i = 0; i < provider.getPropertyBackList.length; i++) {
        //     if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
        //         title.toLowerCase()) {
        //       provider.addTOProprertyList(provider.getPropertyBackList[i]);
        //     }
        //   }
        // }
        //
        setState(() {
          selectedCategory = title.toLowerCase();
          mainType = title.toLowerCase();
        });
      },
      child: Container(
        // height: 25,
        width: MediaQuery.of(context).size.width / 4.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: selectedCategory.toLowerCase() == title.toLowerCase()
                ? Constant.darkblue
                : Constant.blueColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 16,
                color: Colors.white,
              ),
              SizedBox(
                width: 2,
              ),
              CustomText(
                text: title.tr(),
                color: Colors.white,
                size: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
