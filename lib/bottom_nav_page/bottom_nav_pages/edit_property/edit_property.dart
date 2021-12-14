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
import 'package:realestate/Widgets/dop_down_movie.dart';
import 'package:realestate/Widgets/price_field.dart';
import 'package:realestate/Widgets/select_image_option.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:realestate/Widgets/text_field_without_prefix.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';
import 'package:toast/toast.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:csv/csv.dart';

class EditPropertyPage extends StatefulWidget {
  // const EditPropertyPage({Key key}) : super(key: key);
  Property property;

  EditPropertyPage(this.property);

  @override
  _EditPropertyPageState createState() => _EditPropertyPageState();
}

class _EditPropertyPageState extends State<EditPropertyPage> {
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
  List<ImageItem> imagesList = [];
  String currentImage = "";
  final GlobalKey dropdownKey = GlobalKey();
  final GlobalKey dropdownKey1 = GlobalKey();
  final GlobalKey dropdownKey2 = GlobalKey();
  final GlobalKey dropdownKey3 = GlobalKey();

  List ImageUrls = [];
  List governorates = [
    "Kuwait city",
    "Jahra",
    "Hawalli",
    "Farwaniyah",
    "Mubarak Al-Kabeer",
    "Al-Ahmadi"
  ];
  List titles = [
    "bedrooms",
    "materBedRoom",
    "livingRooms",
    "bathrooms",
    "floors",
    "parkingSpots"
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
  TextEditingController area = new TextEditingController();
  TextEditingController name = new TextEditingController();
  String governorate = "All";
  String position = "View on 3 streets";
  String district = "All";
  List currentState = [];
  List<DropdownMenuItem<String>> _popupItemSubCategories1 = [];
  List<DropdownMenuItem<String>> categories = [];

  // List<DropdownMenuItem<String>> drops = [];
  List<DropdownMenuItem<String>> positions = [];
  List<DropdownMenuItem<String>> city = [];
  List<DropdownMenuItem<String>> Havalli = [];
  List<DropdownMenuItem<String>> Mubarak = [];
  List<DropdownMenuItem<String>> all = [];
  List<DropdownMenuItem<String>> Ahmadi = [];
  List<DropdownMenuItem<String>> Farwaniya = [];
  List<DropdownMenuItem<String>> Jahra = [];

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
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            imagesList.length == 0
                                ? Container(
                                    // height: MediaQuery.of(context).size.height/2,
                                    width: MediaQuery.of(context).size.width,
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
                                      enableInfiniteScroll: false,
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
                                    items: imagesList.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return InkWell(
                                            onTap: () {
                                              // ImageViewer.showImageSlider(
                                              //   images:widget.product.imageUrls,
                                              //   startingPosition: currentimageinde,
                                              // );
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                    child: i.type == "uri"
                                                        ? FadeInImage(
                                                            placeholder: AssetImage(
                                                                "Assets/download.png"),
                                                            image: FileImage(
                                                              i.imageFile,
                                                            ),
                                                            fit: BoxFit.cover)
                                                        : FadeInImage(
                                                            placeholder: AssetImage(
                                                                "Assets/download.png"),
                                                            image: NetworkImage(
                                                              i.img,
                                                            ),
                                                            fit: BoxFit.cover),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                      alignment:
                                                          "Are you sure you want to remove this image?"
                                                                      .tr() ==
                                                                  "Are you sure you want to remove this image?"
                                                              ? Alignment
                                                                  .topRight
                                                              : Alignment
                                                                  .topLeft,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showConfirmationDialog(
                                                              context,
                                                              "Are you sure you want to remove this image?"
                                                                  .tr(), () {
                                                            imagesList
                                                                .remove(i);
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.2)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
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
                                    File image = await GetImage(context);
                                    showAlertDialog(context, "Please wait...");
                                    // String imgurl = await uploadimage(image);
                                    setState(() {
                                      ImageItem img = new ImageItem();
                                      img.imageFile = image;
                                      img.type = "uri";
                                      imagesList.add(img);
                                      // ImageUrls.add(imgurl);
                                    });
                                    Navigator.of(context).pop();
                                  }, () async {
                                    // _onImagePicker() async {
                                    MyResponse res =
                                        await PickImages.onMultiPicker(
                                            type: FileType.custom,
                                            allowedExtension: ['jpg', 'png']);
                                    if (res.success) {
                                      FilePickerResult result = res.data;
                                      // ImageUrls
                                      // setState(() {
                                      List<File> imagesur = [];
                                      imagesur.addAll(
                                          PickImages.toImageFile(result));
                                      // _fileProcessing = List.generate(_imageFile.length, (index) => false);
                                      // });
                                      Navigator.of(context).pop();
                                      showAlertDialog(
                                          context, "Please wait...");
                                      for (int i = 0;
                                          i < imagesur.length;
                                          i++) {
                                        ImageItem img = new ImageItem();
                                        img.imageFile = imagesur[i];
                                        img.type = "uri";
                                        imagesList.add(img);
                                        // setState(() {
                                        //
                                        // });
                                      }
                                      Navigator.of(context).pop();
                                      setState(() {});
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
                                        height: 80,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                            Colors.black.withOpacity(0.2)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SvgPicture.asset(
                                                "Assets/camn.svg",
                                                color:Colors.white,
                                                height: 30,
                                              ),
                                              CustomText(
                                                text: "addImages".tr(),
                                                color:Colors.white,                                                size: 14,
                                                // fontWeight: FontWeight.bold,
                                              )
                                            ],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          maxLines: 1,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                30),
                                          ],
                                          decoration: InputDecoration(
                                            prefixIconConstraints:
                                                BoxConstraints(
                                                    minHeight: 24,
                                                    minWidth: 24),
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
                                            hintText: "addPropertyName".tr(),
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
                                    width:
                                        MediaQuery.of(context).size.width / 8,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  typeItem(
                                      context, "rent".tr(), 0, selectedtype,
                                      () {
                                    setState(() {
                                      selectedtype = 0;
                                      selectedtypeName = "Rent";
                                    });
                                  }),
                                  typeItem(
                                      context, "sale".tr(), 1, selectedtype,
                                      () {
                                    setState(() {
                                      selectedtype = 1;
                                      selectedtypeName = "Sale";
                                    });
                                  }),
                                  typeItem(
                                      context, "exchange".tr(), 2, selectedtype,
                                      () {
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
                              categories.length == 0
                                  ? Container()
                                  : dropDownWidget(
                                      context,
                                      dropdownKey,
                                      "category".tr(),
                                      category,
                                      categories, (newValue) {
                                      setState(() {
                                        category = newValue;
                                      });
                                    }),
                              dropDownWidget(
                                  context,
                                  dropdownKey1,
                                  "governorate".tr(),
                                  governorate,
                                  _popupItemSubCategories1, (newValue) {
                                setState(() {
                                  governorate = newValue;
                                });
                              }),
                              dropDownWidget(
                                  context,
                                  dropdownKey2,
                                  "district".tr(),
                                  district,
                                  governorate.toLowerCase().contains("asimah")
                                      ? city
                                      : governorate
                                              .toLowerCase()
                                              .contains("hawalli")
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
                                                          : Ahmadi, (newValue) {
                                setState(() {
                                  district = newValue;
                                });
                              }),
                              dropDownWidget(
                                  context,
                                  dropdownKey3,
                                  "position".tr(),
                                  position,
                                  positions, (newValue) {
                                setState(() {
                                  position = newValue;
                                });
                              }),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: images2.length,
                                  itemBuilder: (context, index) {
                                    return propertyPropertyItem(images2[index],
                                        titles[index], values[index], () {
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
                                  checkboxes(context, "Assets/maid.svg",
                                      "maidRoom".tr(), moreValues[0], () {
                                    setState(() {
                                      moreValues[0] = !moreValues[0];
                                    });
                                  }),
                                  checkboxes(context, "Assets/water.svg",
                                      "swimmingPool".tr(), moreValues[1], () {
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
                                  checkboxes(context, "Assets/locat.svg",
                                      "centralAc".tr(), moreValues[2], () {
                                    setState(() {
                                      moreValues[2] = !moreValues[2];
                                    });
                                  }),
                                  checkboxes(context, "Assets/elevator.svg",
                                      "elevator".tr(), moreValues[3], () {
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
                              pricefield(context, " ${'kwd'.tr()} ",
                                  "addPrice".tr(), price),
                              SizedBox(
                                height: 20,
                              ),
                              pricefield(context, " ${'sqft'.tr()} ",
                                  "addArea".tr(), area),

                              SizedBox(
                                height: 20,
                              ),
                              TextFieldWithDetectorBig(
                                  context,
                                  "",
                                  "description".tr(),
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
                              rowItem("freeAd".tr(), 0, selectedPackageIndex,
                                  () {
                                setState(() {
                                  selectedPackageIndex = 0;
                                });
                              }),
                              rowItem("premium3".tr(), 1, selectedPackageIndex,
                                  () {
                                setState(() {
                                  selectedPackageIndex = 1;
                                });
                              }),
                              rowItem("premium7".tr(), 2, selectedPackageIndex,
                                  () {
                                setState(() {
                                  selectedPackageIndex = 2;
                                });
                              }),
                              SizedBox(
                                height: 10,
                              ),
                              saveButton(context, "Update".tr(), () {
                                if (ImageUrls.length == 0) {
                                  Toast.show("addSomeImages".tr(), context,
                                      duration: 4, gravity: Toast.TOP);
                                } else {
                                  if (name.text == "") {
                                    Toast.show("addName".tr(), context,
                                        duration: 4, gravity: Toast.TOP);
                                  } else {
                                    if (governorate == "") {
                                      Toast.show("addGovernorate".tr(), context,
                                          duration: 4, gravity: Toast.TOP);
                                    } else {
                                      if (price.text == "") {
                                        Toast.show(
                                            "addPriceofProperty".tr(), context,
                                            duration: 4, gravity: Toast.TOP);
                                      } else {
                                        if (area.text == "") {
                                          Toast.show(
                                              "addAreaofProperty".tr(), context,
                                              duration: 4, gravity: Toast.TOP);
                                        } else {
                                          if (description.text == "") {
                                            Toast.show(
                                                "addDescription".tr(), context,
                                                duration: 4,
                                                gravity: Toast.TOP);
                                          } else {
                                            uploadProperty();
                                          }
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
              SafeArea(
                child: GestureDetector(
                  onTap: () {
                    // if (widget.myAddsPage == true) {
                    //   Navigator.of(context).pop();
                    //   Navigator.of(context).pop();
                    // } else {
                    Navigator.of(context).pop();
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black.withOpacity(0.3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  // selectItem(String s, double width) {
  //   return Container(
  //     height: 25,
  //     width: MediaQuery.of(context).size.width / 1.8,
  //     decoration: BoxDecoration(
  //       color: Constant.blueColor,
  //       // border: Border.all(color: Colors.black.withOpacity(0.4))
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           CustomText(
  //             text: category,
  //             color: Colors.white,
  //             size: 13,
  //             // fontWeight: FontWeight.bold,
  //           ),
  //           MyPopupMenuButton(
  //             popupItems: categories,
  //             onSelected: (val) {
  //               setState(() {
  //                 category = val;
  //                 // _popupItemSubCategories2 = _dataStates.where((element) => element[3]==currentCountry[3]).map((cat)
  //                 // {
  //                 //   return PopupMenuItem<dynamic>(
  //                 //     value: cat,
  //                 //     child: Text(
  //                 //       '${cat[1]}',
  //                 //       // style: Text,
  //                 //     ),
  //                 //   );
  //                 // }).toList();
  //                 // print(_popupItemSubCategories2.length);
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                text: tite.tr(),
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

  void _basicContent() async {
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

    Property p = widget.property;
    name.text = p.name;
    print("this is the nigaa causing bugs");
    print(widget.property.district);
    print(widget.property.governorate);
    selectedtypeName = p.availableFor;
    category = p.mainType;
    governorate = p.governorate;
    district = p.district;
    position = p.position;
    if (Constant.positions.contains(p.position)) {
    } else {
      position = Constant.positions[0];
    }
    values = [
      p.bedRooms,
      p.masterBed,
      p.livingRoom,
      p.bathRooms,
      p.floors,
      p.parkingSpots
    ];
    moreValues = [p.maiRoom, p.swimmingPool, p.centralAc, p.elevator];
    price.text = p.price;
    area.text = p.area;
    description.text = p.description;
    selectedPackageIndex = p.packageIndex;
    for (int i = 0; i < p.images.length; i++) {
      ImageItem image = new ImageItem();
      image.img = p.images[i];
      image.type = "url";
      imagesList.add(image);
    }
    ImageUrls = List<String>.from(p.images);
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {});
    });
  }

  Future<void> uploadProperty() async {
    showAlertDialog(context, "pleasewait".tr());
    try {
      String time = widget.property.timeStamp;
      String id = widget.property.id;
      List imagesUrls = [];
      for (int i = 0; i < imagesList.length; i++) {
        if (imagesList[i].type == "uri") {
          String url = await uploadimage(imagesList[i].imageFile);
          imagesUrls.add(url);
        } else {
          imagesUrls.add(imagesList[i].img);
        }
      }
      List newImagesLIst = imagesUrls;
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
          area: area.text,
          status: widget.property.status,
          creatorId:
              Provider.of<RoleIdentifier>(context, listen: false).appuser.id);
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
      Toast.show("propertyAdded".tr(), context,
          duration: 4, gravity: Toast.TOP);
      property.images = imagesUrls;
      setState(() {
        governorate = "All";
        district = "All";
        selectedtypeName = "Rent";
        category = "House";
        values = [0, 0, 0, 0, 0, 0];
        moreValues = [false, false, false, false];
        price.clear();
        description.clear();
        selectedPackageIndex = 0;
        // imagesuri.clear();
        name.clear();
        // imagesUrls.clear();
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PropertyDetailPage(property, true)));
      // hhhh detail page pey property ley k jaani hyy edit k baad
    } catch (e) {
      Navigator.of(context).pop();
      Toast.show("errorOccurred".tr(), context,
          duration: 4, gravity: Toast.TOP);
    }
  }

// dropDownItem(
//     BuildContext context,
//     String title,
//     String value,
//     String placeHolder,
//     List<PopupMenuEntry<dynamic>> catList,
//     Function onselected) {
//   return Column(
//     children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: CustomText(
//           text: title,
//           color: Colors.black.withOpacity(0.7),
//           size: 15,
//           fontWeight: FontWeight.w600,
//
//           // fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       Container(
//         height: 30,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: Constant.blueColor,
//           // border: Border.all(
//           //     color: Colors.black.withOpacity(0.4))
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomText(
//                 text: value.length == 0 ? placeHolder : value,
//                 color: Colors.white,
//                 size: 16.5,
//                 fontWeight: FontWeight.w400,
//               ),
//               MyPopupMenuButton(
//                 popupItems: catList,
//                 onSelected: onselected,
//               ),
//             ],
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 15,
//       ),
//     ],
//   );
// }
}

// class MyPopupMenuButton extends StatelessWidget {
//   final List<PopupMenuEntry<dynamic>> popupItems;
//   final void Function(dynamic newValue) onSelected;
//   final double elevation;
//   final Icon icon;
//   final double iconSize;
//   final EdgeInsets padding;
//
//   MyPopupMenuButton(
//       {@required this.popupItems,
//       @required this.onSelected,
//       this.elevation = 8.0,
//       this.icon = const Icon(Icons.keyboard_arrow_down, color: Colors.black),
//       this.iconSize = 24.0,
//       this.padding = const EdgeInsets.all(0.0)});
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<dynamic>(
//       elevation: elevation,
//       onSelected: onSelected,
//       // tooltip: "this is the tootl",
//       icon: SvgPicture.asset("Assets/arrowbut.svg",
//           height: 5, color: Colors.white),
//       iconSize: iconSize,
//       // child: Text("t"),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(15.0),
//         ),
//       ),
//       padding: EdgeInsets.all(0),
//       itemBuilder: (context) => popupItems,
//     );
//   }
// }
class ImageItem {
  String img, type;
  File imageFile;

  ImageItem({this.img, this.type, this.imageFile});
}
