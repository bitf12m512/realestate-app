import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/get_image_from_gallery.dart';
import 'package:realestate/Function/pick_images.dart';
import 'package:realestate/Function/service.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/Widgets/check_boxes.dart';
import 'package:realestate/Widgets/select_image_option.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:toast/toast.dart';

// import 'package:csv/csv.dart';
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
  int selectedPackageIndex = 0;
  List images2 = [
    "Assets/bed.svg",
    "Assets/bed.svg",
    "Assets/living.svg",
    "Assets/bath.svg",
    "Assets/area2.svg",
    "Assets/garage.svg"
  ];
  List imagesuri = [];
  List governorates = [
    "Kuwait city",
    "Jahra",
    "Hawalli",
    "Farwaniyah",
    "Mubarak Al-Kabeer",
    "Al-Ahmadi"
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
  String selectedtypeName = "Rent";
  String country;
  String category = "House";
  TextEditingController description = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController name = new TextEditingController();
  String governorate = "";
  String position = "";
  String district = "";
  List currentState = [];
  List<PopupMenuEntry<dynamic>> _popupItemSubCategories1 = [];
  List<PopupMenuEntry<dynamic>> categories = [];
  List<PopupMenuEntry<dynamic>> positions = [];
  List<PopupMenuEntry<dynamic>> city = [];
  List<PopupMenuEntry<dynamic>> Havalli = [];
  List<PopupMenuEntry<dynamic>> Mubarak = [];
  List<PopupMenuEntry<dynamic>> Ahmadi = [];
  List<PopupMenuEntry<dynamic>> Farwaniya = [];
  List<PopupMenuEntry<dynamic>> Jahra = [];

  // This function is triggered when the floating button is pressed
  // void _loadCSV() async {
  //   final _rawData = await rootBundle.loadString("Assets/countries.csv");
  //   List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData, eol: '\n');
  //   final _rawData2 = await rootBundle.loadString("Assets/states.csv");
  //   List<List<dynamic>> _listData2 = CsvToListConverter().convert(_rawData, eol: '\n');
  //   setState(() {
  //     _dataCountries = _listData;
  //     _dataStates=_listData2;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    // _loadCSV();
    _basicContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    imagesuri.length == 0
                        ? Container(
                      // height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(50.0),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(20),
                      //         bottomRight: Radius.circular(20)),
                      //     child: FadeInImage(
                      //         placeholder:
                      //             AssetImage("Assets/realestateL@3x.png"),
                      //         image: AssetImage(
                      //           "Assets/realestateL@3x.png",
                      //         ),
                      //         fit: BoxFit.cover),
                      //   ),
                      // ),
                    )
                        : CarouselSlider(
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
                        autoPlayAnimationDuration:
                        Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // currentimageindex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imagesuri.map((i) {
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: FadeInImage(
                                      placeholder:
                                      AssetImage("download.png"),
                                      image: FileImage(
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
                      child: GestureDetector(
                        onTap: () {
                          imageSelectionOption(context, () async {
                            Navigator.of(context).pop();
                            File image = await GetImage();

                            setState(() {
                              imagesuri.add(image);
                            });
                          }, () async {
                            // _onImagePicker() async {
                            MyResponse res = await PickImages.onMultiPicker(
                                type: FileType.custom,
                                allowedExtension: ['jpg', 'png']);
                            if (res.success) {
                              FilePickerResult result = res.data;
                              setState(() {
                                imagesuri
                                    .addAll(PickImages.toImageFile(result));
                                // _fileProcessing = List.generate(_imageFile.length, (index) => false);
                              });
                              Navigator.of(context).pop();
                            } else {
                              // showSnackBar(context, message: res.message);
                            }
                            // }
                          });
                        },
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
                                      color: Constant.darkblue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: "Add images",
                                color: Constant.blueColor,
                                size: 20,
                                // fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
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
                              Expanded(
                                child: TextFormField(
                                  controller: name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      // ignore: missing_return
                                      return 'Field cannot be blank.';
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  decoration: InputDecoration(
                                    prefixIconConstraints: BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                        // hinttext.toLowerCase()=="Description".toLowerCase()?10:
                                        12,
                                        horizontal:
                                        // hinttext.toLowerCase()=="Description".toLowerCase()?20:
                                        10),
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    hintText: "Add property Name",
                                    // labelText: "Property",
                                    filled: true,
                                    isDense: true,
                                    enabled: true,
                                    fillColor: Constant.appColor,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      new BorderRadius.circular(1.0),
                                      borderSide: new BorderSide(
                                          color: Colors.transparent,
                                          width: 1.3),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                      borderSide: new BorderSide(
                                          color: Colors.transparent,
                                          width: 1.3),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                      borderSide: new BorderSide(
                                          color: Colors.transparent,
                                          width: 1.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                      borderSide: new BorderSide(
                                          color: Colors.transparent,
                                          width: 1.3),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent),
                                    ),
                                    // focusedBorder: InputBorder.none,
                                    // enabledBorder: InputBorder.none,
                                    // errorBorder: InputBorder.none,
                                    // disabledBorder: InputBorder.none,
                                  ),
                                ),
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constant.blueColor,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                              selectedtypeName = "Rent";
                            });
                          }),
                          typeItem(context, "Sale", 1, selectedtype, () {
                            setState(() {
                              selectedtype = 1;
                              selectedtypeName = "Sale";
                            });
                          }),
                          typeItem(context, "Exchange", 2, selectedtype, () {
                            setState(() {
                              selectedtype = 2;
                              selectedtypeName = "Exchange";
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
                      dropDownItem(context,"Category",category,category,categories,(val) {
                        setState(() {
                          category = val;
                        });
                      }),
                      dropDownItem(context,"Governorate",governorate,"Choose Governorate",_popupItemSubCategories1,(val) {
                        setState(() {
                          governorate = val;
                        });
                      }),
                      dropDownItem(context,"District",district,"Choose District",governorate.toLowerCase()
                          .contains("city") ? city : governorate
                          .toLowerCase().contains("Hawalli")
                          ? Havalli
                          :governorate.toLowerCase()
                          .contains("Jahra")?Jahra:governorate.toLowerCase()
                          .contains("Farwaniyah")?Farwaniya:governorate.toLowerCase()
                          .contains("Mubarak")?Mubarak:Ahmadi,(val) {
                        setState(() {
                          district = val;
                        });
                      }),
                      dropDownItem(context,"Position of RealEstate",position,"Choose Position",positions,(val) {
                        setState(() {
                          position = val;
                        });
                      }),
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
                          checkboxes(context, "Assets/maid.svg", "Maid Room",
                              moreValues[0], () {
                                setState(() {
                                  moreValues[0] = !moreValues[0];
                                });
                              }),
                          checkboxes(context, "Assets/water.svg",
                              "Swimming Pool", moreValues[1], () {
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
                          checkboxes(context, "Assets/locat.svg", "Central AC",
                              moreValues[2], () {
                                setState(() {
                                  moreValues[2] = !moreValues[2];
                                });
                              }),
                          checkboxes(context, "Assets/elevator.svg", "Elevator",
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

                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child:
                      //   Container(
                      //     width: MediaQuery.of(context).size.width / 1.3,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: Colors.black.withOpacity(0.4))),
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 8.0, vertical: 5),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           CustomText(
                      //             text: "Position of Realestate",
                      //             color: Colors.black.withOpacity(0.4),
                      //             size: 15,
                      //             fontWeight: FontWeight.w600,
                      //
                      //             // fontWeight: FontWeight.bold,
                      //           ),
                      //           SvgPicture.asset("Assets/arrowbut.svg",
                      //               height: 11,
                      //               color: Colors.black.withOpacity(0.6))
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.1,
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
                                  text: " KWD ",
                                  color: Colors.white,
                                  size: 13,
                                  fontWeight: FontWeight.w500,

                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Constant.blueColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: price,
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
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                          // keyboardType: TextInputType.number
                                          inputFormatters: [LengthLimitingTextInputFormatter(
                                              12),
                                            // WhitelistingTextInputFormatter.digitsOnly,
                                            FilteringTextInputFormatter.digitsOnly
                                            // WhitelistingTextInputFormatter.digitsOnly
                                          ],

                                          decoration: InputDecoration(
                                            prefixIconConstraints:
                                            BoxConstraints(
                                                minHeight: 24,
                                                minWidth: 24),
                                            contentPadding: EdgeInsets
                                                .symmetric(
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
                                            hintText: "Add Price",
                                            // labelText: "Property",
                                            filled: true,
                                            isDense: true,
                                            enabled: true,
                                            fillColor: Constant.appColor,
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(
                                                  1.0),
                                              borderSide: new BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.3),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1)),
                                              borderSide: new BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.3),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1)),
                                              borderSide: new BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.3),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1)),
                                              borderSide: new BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.3),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1)),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent),
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWithDetectorBig(
                          context,
                          "",
                          "Description",
                          true,
                          description,
                          TextInputType.text,
                          1000, () {
                        // setState(() {
                        //   selected=2;
                        // });
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      rowItem("Free Ad", 0, selectedPackageIndex, () {
                        setState(() {
                          selectedPackageIndex = 0;
                        });
                      }),
                      rowItem("Premium ad: 3 days for 3 kwd", 1,
                          selectedPackageIndex, () {
                            setState(() {
                              selectedPackageIndex = 1;
                            });
                          }),
                      rowItem("Premium ad: 7 days for 5 kwd", 2,
                          selectedPackageIndex, () {
                            setState(() {
                              selectedPackageIndex = 2;
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      saveButton(context, "Upload", () {
                        if (imagesuri.length == 0) {
                          Toast.show("Please add some images of your Property.",
                              context,
                              duration: 4, gravity: Toast.TOP);
                        } else {
                          if (name.text == "") {
                            Toast.show(
                                "Please add name of your Property.", context,
                                duration: 4, gravity: Toast.TOP);
                          } else {
                            if (governorate == "") {
                              Toast.show(
                                  "Please add Governorate of your Property.",
                                  context,
                                  duration: 4,
                                  gravity: Toast.TOP);
                            } else {
                              if (price.text == "") {
                                Toast.show("Please add Price of your Property.",
                                    context,
                                    duration: 4, gravity: Toast.TOP);
                              } else {
                                if (description.text == "") {
                                  Toast.show(
                                      "Please add some description of your Property.",
                                      context,
                                      duration: 4,
                                      gravity: Toast.TOP);
                                } else {
                                  uploadProperty();
                                }
                              }
                            }
                          }
                        }
                      }),
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

  selectItem(String s, double width) {
    return Container(
      height: 25,
      width: MediaQuery
          .of(context)
          .size
          .width / 1.8,
      decoration: BoxDecoration(
        color: Constant.blueColor,
          // border: Border.all(color: Colors.black.withOpacity(0.4))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: category,
              color: Colors.white,
              size: 13,
              // fontWeight: FontWeight.bold,
            ),
            MyPopupMenuButton(
              popupItems: categories,
              onSelected: (val) {
                setState(() {
                  category = val;
                  // _popupItemSubCategories2 = _dataStates.where((element) => element[3]==currentCountry[3]).map((cat)
                  // {
                  //   return PopupMenuItem<dynamic>(
                  //     value: cat,
                  //     child: Text(
                  //       '${cat[1]}',
                  //       // style: Text,
                  //     ),
                  //   );
                  // }).toList();
                  // print(_popupItemSubCategories2.length);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget propertyPropertyItem(String img, String tite, int val, Function ontap1,
      Function ontap2) {
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

  rowItem(String title, int current, int selected, Function ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Icon(current == selected
                ? Icons.check_box
                : Icons.check_box_outline_blank_outlined),
            SizedBox(
              width: 7,
            ),
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

  void _basicContent() {
    setState(() {
      _popupItemSubCategories1 = governorates.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      categories = Constant.cats.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      city = Constant.City.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      Havalli = Constant.Havalli.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      positions = Constant.positions.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      Mubarak = Constant.Mubarak.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      Ahmadi = Constant.Ahmadi.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      Farwaniya = Constant.Farwaniya.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
      Jahra = Constant.Jahra.map((cat) {
        return PopupMenuItem<dynamic>(
          value: cat,
          child: Text(
            '${cat}',
            // style: Text,
          ),
        );
      }).toList();
    });
  }

  Future<void> uploadProperty() async {
    showAlertDialog(context, "Please wait...");
    try {
      String time = DateTime
          .now()
          .toUtc()
          .millisecondsSinceEpoch
          .toString();
      String id =
          FirebaseDatabase.instance
              .reference()
              .child("Properties")
              .push()
              .key;
      List imagesUrls = [];
      for (int i = 0; i < imagesuri.length; i++) {
        String url = await uploadimage(imagesuri[i]);
        imagesUrls.add(url);
      }
      Property property = new Property(
          name: name.text,
          availableFor: selectedtypeName,
          mainType: category,
          governorate: governorate,
          district: district,
          bedRooms: values[0],
          masterBed: values[1],
          livingRoom: values[2],
          bathRooms: values[3],
          floors: values[4],
          parkingSpots: values[5],
          maiRoom: moreValues[0],
          swimmingPool: moreValues[1],
          centralAc: moreValues[2],
          elevator: moreValues[3],
          position: governorate,
          price: price.text,
          description: description.text,
          packageIndex: selectedPackageIndex,
          timeStamp: time,
          id: id,
          status: "Pending",
          creatorId:
          Provider
              .of<RoleIdentifier>(context, listen: false)
              .appuser
              .id);
      await FirebaseDatabase.instance
          .reference()
          .child("Properties")
          .child(id)
          .set(property.toMap());
      await FirebaseDatabase.instance
          .reference()
          .child("Properties")
          .child(id)
          .update({"images": imagesUrls});
      Navigator.of(context).pop();
      Toast.show(
          "Property added successfully.",
          context,
          duration: 4,
          gravity: Toast.TOP);
      setState(() {
        governorate = "";
        selectedtypeName = "Rent";
        category = "House";
        values = [0, 0, 0, 0, 0, 0];
        moreValues = [false, false, false, false];
        price.clear();
        description.clear();
        selectedPackageIndex = 0;
        imagesuri.clear();
        name.clear();
        imagesUrls.clear();
      });
    }
    catch (e) {
      Navigator.of(context).pop();
      Toast.show(
          "An error occurred. Try again later.",
          context,
          duration: 4,
          gravity: Toast.TOP);
    }
  }

  dropDownItem(BuildContext context, String title,String value,String placeHolder,List<PopupMenuEntry<dynamic>> catList,Function onselected) {
    return    Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: title,
            color: Colors.black.withOpacity(0.7),
            size: 15,
            fontWeight: FontWeight.w600,

            // fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 30,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Constant.blueColor,
            // border: Border.all(
            //     color: Colors.black.withOpacity(0.4))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: value.length == 0
                      ? placeHolder
                      : value,
                  color: Colors.white,
                  size: 16.5,
                  fontWeight: FontWeight.w400,
                ),
                MyPopupMenuButton(
                  popupItems: catList,
                  onSelected: onselected,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class MyPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<dynamic>> popupItems;
  final void Function(dynamic newValue) onSelected;
  final double elevation;
  final Icon icon;
  final double iconSize;
  final EdgeInsets padding;

  MyPopupMenuButton({@required this.popupItems,
    @required this.onSelected,
    this.elevation = 8.0,
    this.icon = const Icon(Icons.keyboard_arrow_down, color: Colors.black),
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(0.0)});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
      elevation: elevation,
      onSelected: onSelected,
      icon: SvgPicture.asset("Assets/arrowbut.svg",
          height: 5, color: Colors.white),
      iconSize: iconSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      padding: EdgeInsets.all(0),
      itemBuilder: (context) => popupItems,
    );
  }
}
