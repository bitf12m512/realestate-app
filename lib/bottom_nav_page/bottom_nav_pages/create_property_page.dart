import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/package.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Classes/transaction.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/get_image_from_gallery.dart';
import 'package:realestate/Function/pick_images.dart';
import 'package:realestate/Function/service.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/Widgets/check_boxes.dart';
import 'package:realestate/Widgets/dop_down_movie.dart';
import 'package:realestate/Widgets/drop_down_button.dart';
import 'package:realestate/Widgets/price_field.dart';
import 'package:realestate/Widgets/select_image_option.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:realestate/bottom_nav_page/bottom_nav_pages/edit_property/edit_property.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';
import 'package:toast/toast.dart';
import 'package:easy_localization/easy_localization.dart';

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
  int selectedPackageIndex = 1000;
  Package selectedPackage=new Package();
  final GlobalKey dropdownKey = GlobalKey();
  final GlobalKey dropdownKey1 = GlobalKey();
  final GlobalKey dropdownKey2 = GlobalKey();
  final GlobalKey dropdownKey3 = GlobalKey();
  List images2 = [
    "Assets/bed.svg",
    "Assets/bed.svg",
    "Assets/living.svg",
    "Assets/bath.svg",
    "Assets/area2.svg",
    "Assets/garage.svg"
  ];
  List imagesuri = [];

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

  TextEditingController description = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController name = new TextEditingController();
  String governorate = "All";
  String category = "All";
  String position = "All";
  String district = "All";
  List currentState = [];
  List<DropdownMenuItem<String>> _popupItemSubCategories1 = [];
  List<DropdownMenuItem<String>> categories = [];
  final _focusNode = FocusNode();
  List<DropdownMenuItem<String>> all = [];
  List<DropdownMenuItem<String>> positions = [];
  List<DropdownMenuItem<String>> city = [];
  List<DropdownMenuItem<String>> Havalli = [];
  List<DropdownMenuItem<String>> Mubarak = [];
  List<DropdownMenuItem<String>> Ahmadi = [];
  List<DropdownMenuItem<String>> Farwaniya = [];
  List<DropdownMenuItem<String>> Jahra = [];

  @override
  void initState() {
    // TODO: implement initState
    // _loadCSV();
    _basicContent();
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus == false) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        Future.delayed(Duration(milliseconds: 800)).then((value) {
          currentFocus.unfocus();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RoleIdentifier>(builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
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
                                FocusScopeNode currentFocus = FocusScope.of(
                                    context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
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
                                    width:
                                    MediaQuery
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
                                          AssetImage("Assets/download.png"),
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
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                Navigator.of(context).pop();
                                File image = await GetImage(context);

                                setState(() {
                                  if (image != null) {
                                    imagesuri.add(image);
                                  }
                                });
                              }, () async {
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                // _onImagePicker() async {
                                MyResponse res = await PickImages.onMultiPicker(
                                    type: FileType.custom,
                                    allowedExtension: ['jpg', 'png']);
                                if (res.success) {
                                  FilePickerResult result = res.data;
                                  setState(() {
                                    if (result != null) {
                                      imagesuri
                                          .addAll(
                                          PickImages.toImageFile(result));
                                    }

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
                                    height: 80,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                        Colors.black.withOpacity(0.1)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            "Assets/camn.svg",
                                            color:Colors.white,                                            height: 30,
                                          ),
                                          CustomText(
                                            text: "addImages".tr(),
                                            color:Colors.white,                                            size: 14,
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: name,
                                      focusNode: _focusNode,
                                      // onEditingComplete: () {
                                      //   print("editting completed");
                                      //   print("editting completed");
                                      //   print("editting completed");
                                      // },
                                      // onFieldSubmitted: (val){
                                      //   print("Field submitted completed");
                                      //   print("Field submitted completed");
                                      //   print("Field submitted completed");
                                      //
                                      // },
                                      // onSaved: (val){
                                      //   print("Value saved   submitted completed");
                                      //   print("Value saved   submitted completed");
                                      //   print("Value saved   submitted completed");
                                      // },
                                      autofocus: false,
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
                                      textAlignVertical: TextAlignVertical
                                          .center,
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
                                        hintText: "addPropertyName".tr(),
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
                                  // SvgPicture.asset(
                                  //   "Assets/editp.svg",
                                  //   height: 25,
                                  //   color: Colors.black.withOpacity(0.8),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Container(
                              //   height: 3,
                              //   width: MediaQuery.of(context).size.width / 8,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: Constant.blueColor,
                              //   ),
                              // ),
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
                              typeItem(
                                  context, "rent".tr(), 0, selectedtype, () {
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                setState(() {
                                  selectedtype = 0;
                                  selectedtypeName = "Rent";
                                });
                              }),
                              typeItem(
                                  context, "sale".tr(), 1, selectedtype, () {
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                setState(() {
                                  selectedtype = 1;
                                  selectedtypeName = "Sale";
                                });
                              }),
                              typeItem(context, "exchange".tr(), 2,
                                  selectedtype, () {
                                    FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
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
                              context, dropdownKey, "category".tr(),
                              category, categories, (newValue) {
                            setState(() {
                              category = newValue;
                            });
                          }),
                          dropDownWidget(
                              context, dropdownKey1, "governorate".tr(),
                              governorate, _popupItemSubCategories1, (
                              newValue) {
                            governorate = newValue;
                            print(governorate);
                            print("this is governorate");
                            setState(() {

                            });
                          }),
                          dropDownWidget(
                              context,
                              dropdownKey2,
                              "district".tr(),
                              district,
                              governorate.toLowerCase().contains("asimah")
                                  ? city
                                  : governorate.toLowerCase().contains(
                                  "hawalli")
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
                          dropDownWidget(context, dropdownKey3, "position".tr(),
                              position, positions, (newValue) {
                                setState(() {
                                  position = newValue;
                                });
                              }),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: images2.length,
                              itemBuilder: (context, index) {
                                return propertyPropertyItem(
                                    images2[index], titles[index],
                                    values[index],
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
                              checkboxes(
                                  context, "Assets/maid.svg", "maidRoom".tr(),
                                  moreValues[0], () {
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
                          SizedBox(
                            height: 20,
                          ),
                          pricefield(
                              context, " ${'kwd'.tr()} ", "addPrice".tr(),
                              price),
                          SizedBox(
                            height: 20,
                          ),
                          pricefield(
                              context, " ${'sqft'.tr()} ", "addArea".tr(),
                              area),
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
                          rowItem("freeAd".tr(), 0, selectedPackage.price!=null?1:0, () {
                            setState(() {
                              selectedPackageIndex = 0;
                              selectedPackage=new Package();
                            });
                          }),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 0.0),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.packages.length,
                                itemBuilder: (context, index) {
                                  return rowItem("${'Premium ad:'.tr()} ${provider
                                      .packages[index].days} ${'days for'
                                      .tr()} ${provider.packages[index]
                                      .price} ${'kwd'.tr()}", index+1,
                                      selectedPackage.price==provider.packages[index].price?index+1:0, () {
                                        setState(() {
                                          selectedPackage=provider.packages[index];
                                          selectedPackageIndex = 0;
                                        });
                                      });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          saveButton(context, "upload".tr(), () {
                            FocusScopeNode currentFocus = FocusScope.of(
                                context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }

                            if (imagesuri.length == 0) {
                              Toast.show(
                                  "addSomeImages".tr(),
                                  context,
                                  duration: 4,
                                  gravity: Toast.TOP);
                            } else {
                              if (name.text == "") {
                                Toast.show(
                                    "addName".tr(), context,
                                    duration: 4, gravity: Toast.TOP);
                              } else {
                                if (governorate == "") {
                                  Toast.show(
                                      "addGovernorate".tr(),
                                      context,
                                      duration: 4,
                                      gravity: Toast.TOP);
                                } else {
                                  if (price.text == "") {
                                    Toast.show(
                                        "addPriceofProperty".tr(),
                                        context,
                                        duration: 4,
                                        gravity: Toast.TOP);
                                  } else {
                                    if (area.text == "") {
                                      Toast.show(
                                          "addAreaofProperty".tr(),
                                          context,
                                          duration: 4,
                                          gravity: Toast.TOP);
                                    } else {
                                      if (description.text == "") {
                                        Toast.show(
                                            "addDescription".tr(),
                                            context,
                                            duration: 4,
                                            gravity: Toast.TOP);
                                      } else {
                                        String id = FirebaseDatabase.instance
                                            .reference()
                                            .child("Properties")
                                            .push()
                                            .key;
                                        if (selectedPackage.price!= null) {
                                          double price =double.parse(selectedPackage.price);
                                          showAlertDialog(
                                              context, "Please wait...".tr());
                                          MFSDK.init(
                                              "https://apitest.myfatoorah.com",
                                              "bearer oK8WyoBSHx5yUU1E5Bp1qtBqI7QSgC_1s7lG3VRAbKzwIBx3ubiePJqvFG4OCdZhEmBB7jpIIbtcDOw0uz5tMpukeE9JTl8CybBs0XKd0faR8kvQME0ZqyfHjbKNaW69PgAtyllatxLKKT76yACudOSWXhzj9ayKq3vGgpoHG5wkyqGyuYF16junlBcHerCYM8uc7KSD0kLpidzumhm0gGrDraD-y3mw-gge8bmYbZPaQFk_TspZPVJY2aoR_3krZ1t7-Aa6IC8sbm4Zegj9T4zTpsH-jLFvmrwWw6_332vRGrQcvPl72IaO_KIH43BRX-b-4PDpLveMKiIRyHT--0zYAZKU2JuHRGHenewtqc75-9RHrZnw66T-wVZwI9Oothene0lxcAc0mELZ2AHOpmyI2R1H1jUPoWcstlPKuCi-ZdPzXNTJXVgqlnIBVbwYiYvjykeTNthYlTRSHUbRPPrCnO8Bx2W5Pwez7Prs-tSUiXgtLc4BP34J2XQq2-6Pc51OP32-XkTRMbqifF2GUSEWrJkGXZes7972bWFFh4brjld2ZzqsPG7K_QWmS__qbWPmHvmRRU7_sMGb751_-0bCsAdon_lNzjwq6_KnRG0sZ56hEq8VXfiPWDqPYirFHkZqtkFO1Y4LSOgf3PscZCP1N657rnNF90XQgqc1wTTXT0naHIx1XpSzgzRauLiHFUiTqg");
                                          var request = new MFInitiatePaymentRequest(
                                              price,
                                              MFCurrencyISO.KUWAIT_KWD);
                                          MFSDK.setUpAppBar(
                                              isShowAppBar: false);
                                          MFSDK.initiatePayment(
                                              request,
                                              MFAPILanguage.EN,
                                                  (MFResult<
                                                  MFInitiatePaymentResponse>
                                              result) =>
                                              {
                                                if (result.isSuccess())
                                                  {
                                                    executePaymenrNow(
                                                        price.toString(), id)
                                                  }
                                                else
                                                  {
                                                    Navigator.of(context).pop(),
                                                  }
                                              });
                                        }
                                        else {
                                          uploadProperty(id);
                                        }
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
        );
      },),
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
            // MyPopupMenuButton(
            //   popupItems: categories,
            //   onSelected: (val) {
            //     setState(() {
            //       category = val;
            //       // _popupItemSubCategories2 = _dataStates.where((element) => element[3]==currentCountry[3]).map((cat)
            //       // {
            //       //   return PopupMenuItem<dynamic>(
            //       //     value: cat,
            //       //     child: Text(
            //       //       '${cat[1]}',
            //       //       // style: Text,
            //       //     ),
            //       //   );
            //       // }).toList();
            //       // print(_popupItemSubCategories2.length);
            //     });
            //   },
            // ),
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

  void _basicContent() {
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
    // dropdownKey.
    // _popupItemSubCategories1 = Constant.governorates.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // categories = Constant.cats.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // city = Constant.City.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // Havalli = Constant.Havalli.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // positions = Constant.positions.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // Mubarak = Constant.Mubarak.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // Ahmadi = Constant.Ahmadi.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // Farwaniya = Constant.Farwaniya.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    // Jahra = Constant.Jahra.map((cat) {
    //   return PopupMenuItem<dynamic>(
    //     value: cat,
    //     child: Text(
    //       '${cat}',
    //       // style: Text,
    //     ),
    //   );
    // }).toList();
    setState(() {});
  }

  Future<void> uploadProperty(String idd) async {
    String premiumTill="";
    String time = DateTime
        .now()
        .toUtc()
        .millisecondsSinceEpoch
        .toString();
    if(selectedPackage.price==null){
      premiumTill=time;

    }
    else{
      premiumTill=(int.parse(time) +(int.parse(selectedPackage.days)*86400000)).toString();
    }
    showAlertDialog(context, "pleasewait".tr());
    try {

      String id = idd;

      List imagesUrls = [];
      for (int i = 0; i < imagesuri.length; i++) {
        // File f=await FlutterExifRotation.rotateAndSaveImage(path: imagesuri[i]);
        // File file = File(yourPath);
        // File f=imagesuri[i];
        // File compressedFile = await FlutterImageCompress.compressAndGetFile(imagesuri[i].absolute.path, imagesuri[i].absolute.path);
        String url = await uploadimage(imagesuri[i]);
        imagesUrls.add(url);
      }
      Property property = new Property(
          name: name.text,
          availableFor: selectedtypeName,
          mainType: category,
          premiumTill: premiumTill,
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
          position: position,
          price: price.text,
          description: description.text,
          packageIndex: selectedPackageIndex,
          timeStamp: time,
          id: id,
          status: "Pending",
          area: area.text,
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
      property.images=imagesUrls;
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PropertyDetailPage(
              property,
              false)));
      Toast.show("propertyAdded".tr(), context,
          duration: 4, gravity: Toast.TOP);
      setState(() {
        // governorate = "";
        selectedtypeName = "Rent";
        category = "House";
        values = [0, 0, 0, 0, 0, 0];
        moreValues = [false, false, false, false];
        price.clear();
        description.clear();
        selectedPackageIndex = 0;
        imagesuri = [];
        district = "All";
        governorate = "All";
        name.clear();
        area.clear();
        position = "View on 3 streets";
        imagesUrls = [];
      });
    } catch (e) {
      Navigator.of(context).pop();
      Toast.show("errorOccurred".tr(), context,
          duration: 4, gravity: Toast.TOP);
    }
  }

  executePaymenrNow(String price, String id) async {
    print("here to execute payments");
    var p = Provider.of<RoleIdentifier>(context, listen: false);
    int paymentMethod = 1;
    var request1 =
    new MFExecutePaymentRequest(paymentMethod, double.parse(price));
    request1.customerName = p.appuser.firstName;
    MFSDK.executePayment(
        context,
        request1,
        MFAPILanguage.EN,
            (String invoiceId, MFResult<MFPaymentStatusResponse> result) =>
        {
          if (result.isSuccess())
            {
              Navigator.of(context).pop(),
              transaction(result, id),
              Toast.show("Payment Successful.".tr(), context,
                  duration: 4, gravity: Toast.TOP),
            }
          else
            {
              Navigator.of(context).pop(),
              Future.delayed(Duration(seconds: 1)).then((value) {
                if (result.error.code.toString() == "107") {
                  Toast.show(
                      "An error occurred. Try again later.".tr(), context,
                      duration: 4, gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF001") {
                  Toast.show(
                      'Transaction Failed, possible reasons (user inserted a wrong password, cardholder/card issuer are not enrolled with 3DS, or the issuer bank has technical issue).'
                          .tr(),
                      context,
                      duration: 4,
                      gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF002") {
                  Toast.show(
                      'Transaction Failed, possible reasons (invalid card details, insufficient funds, denied by risk, the card is expired/held, or card is not enabled for online purchase)'
                          .tr(),
                      context,
                      duration: 4,
                      gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF003") {
                  Toast.show(
                      'Transaction Failed, possible reasons (unsupported card BIN, fraud detection, or security blocking rules).'
                          .tr(),
                      context,
                      duration: 4,
                      gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF004") {
                  Toast.show('Transaction Failed, Insufficient funds'.tr(),
                      context,
                      duration: 4, gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF005") {
                  Toast.show(
                      'Transaction Failed, connection timed out. Try again later.'
                          .tr(),
                      context,
                      duration: 4,
                      gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF007") {
                  Toast.show(
                      'Transaction Failed, Card is expired.'.tr(), context,
                      duration: 4, gravity: Toast.TOP);
                } else if (result.error.toString() == "MF008") {
                  Toast.show(
                      "Transaction Failed, The card issuer doesn't respond."
                          .tr(),
                      context,
                      duration: 4,
                      gravity: Toast.TOP);
                } else if (result.error.code.toString() == "MF010") {
                  Toast.show('Transaction Failed, Wrong Security Code'.tr(),
                      context,
                      duration: 4, gravity: Toast.TOP);
                } else {
                  Toast.show('Transaction was incomplete.'.tr(), context,
                      duration: 4, gravity: Toast.TOP);
                }
              })
            }
        });
  }

  transaction(MFResult<MFPaymentStatusResponse> val, String id) async {
    var provider = Provider.of<RoleIdentifier>(context, listen: false);
    Transaction transaction = new Transaction();
    // transaction.subscription =
    // provider.subscriptionList[selectedSubscriptionIndex];

    List<String> transactionValues = [];
    // TransactionId: 060696062978343563, PaymentId: 060696062978343563
    var result = val.response.toJson();
    transaction.paymentId = result["InvoiceTransactions"][0]["PaymentId"];
    transaction.Id = result["InvoiceTransactions"][0]["TransactionId"];
    transaction.propertyId = id;
    transaction.timeStamp =
        DateTime
            .now()
            .toLocal()
            .millisecondsSinceEpoch
            .toString();
    transaction.userId = provider.appuser.id;
    String transactionUID =
        FirebaseDatabase.instance
            .reference()
            .child("Transactions")
            .push()
            .key;
    transaction.nodeId = transactionUID;
    String x = "0";
    try {
      showAlertDialog(context, "Please wait...".tr());
      await FirebaseDatabase.instance
          .reference()
          .child("Transactions")
          .child(transactionUID)
          .set(transaction.toMap());
      Navigator.pop(context);
      uploadProperty(id);
      // // Subscription sub = new Subscription();
      // // String purchasingTime=DateTime.now().toUtc().millisecondsSinceEpoch.toString();
      // // sub = provider.subscriptionList[selectedSubscriptionIndex];
      // sub.remainingAds = sub.totalAds;
      // String hii = (int.parse(purchasingTime) +
      //     (86400000 * int.parse(sub.totalDays)))
      //     .toString();
      // sub.purchasingTimeStamp=purchasingTime;
      // sub.expiryTimeStamp = hii;
      // if (provider.appuser.subscription == null)
      //   provider.appuser.subscription = [];
      // provider.appuser.subscription.add(sub);
      // if (provider.appuser.remaningAdds == null)
      //   provider.appuser.remaningAdds = 0;
      // provider.appuser.remaningAdds =
      //     provider.appuser.remaningAdds + int.parse(sub.totalAds);
      // List<Subscription> s = provider.appuser.subscription.toList();
      // provider.appuser.subscription.sort((a, b) => a.expiryTimeStamp.compareTo(b.expiryTimeStamp));
      // await FirebaseDatabase.instance
      //     .reference()
      //     .child("Users")
      //     .child(provider.appuser.id)
      //     .child("subscription")
      //     .remove();
      // for (int o = 0; o < s.length; o++) {
      //   await FirebaseDatabase.instance
      //       .reference()
      //       .child("Users")
      //       .child(provider.appuser.id)
      //       .child("subscription")
      //       .update({o.toString(): s[o].toMap()});
      // }
      // await FirebaseDatabase.instance
      //     .reference()
      //     .child("Users")
      //     .child(provider.appuser.id)
      //     .update({"remaningAdds": provider.appuser.remaningAdds});
      // Navigator.of(context).pop();
      // Toast.show('Subscribed to the selected package.'.tr(), context,
      //     duration: 4, gravity: Toast.TOP);
      // setTimers();
      setState(() {});
    } catch (e) {
      Navigator.of(context).pop();
      Toast.show('An error occurred. Please try again later.'.tr(), context,
          duration: 4, gravity: Toast.TOP);
    }
    return;
  }
}
