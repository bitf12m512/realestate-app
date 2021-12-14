import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/no_property_found.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/edit_property/edit_property.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';

class MyAddsPage extends StatefulWidget {
  const MyAddsPage({Key key}) : super(key: key);

  @override
  _MyAddsPageState createState() => _MyAddsPageState();
}

class _MyAddsPageState extends State<MyAddsPage> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RoleIdentifier>(
        builder: (context, provider, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                roundedAppBarwithBack(context, "myAds".tr(), () {
                  Navigator.pop(context);
                }),
                Row(
                  children: [
                    typeItem("Published".tr(), 0, selected, () {
                      setState(() {
                        selected = 0;
                      });
                    }),
                    typeItem("Pending".tr(), 1, selected, () {
                      setState(() {
                        selected = 1;
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
                      child: provider.getMyPropertyList.length == 0
                          ? noPropertyFoundWidget(context,
                              "You haven't added any Property yet.".tr())
                          : selected == 0
                              ? noPropertyFoundWidget(
                                  context, "No Published Adds found".tr())
                              : ListView.builder(
                                  itemCount: provider.getMyPropertyList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          bottom: 10,
                                          top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PropertyDetailPage(
                                                          provider.getMyPropertyList[
                                                              index],
                                                          false)));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 3,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                  // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height /
                                                                5,
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft: Radius
                                                                        .circular(
                                                                            15),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15)),
                                                            child: Image.network(
                                                              provider
                                                                  .getMyPropertyList[
                                                                      index]
                                                                  .images[0],
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            AutoDirection(
                                                             text:provider
                                                                 .getMyPropertyList[
                                                             index]
                                                                 .name ,
                                                              child: CustomText(
                                                                text: provider
                                                                    .getMyPropertyList[
                                                                        index]
                                                                    .name.length>25?"${provider
                                                                    .getMyPropertyList[
                                                                index]
                                                                    .name.substring(0,22)}..":provider
                                                                    .getMyPropertyList[
                                                                index]
                                                                    .name,
                                                                color:
                                                                    Colors.black,
                                                                size: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            // Container(
                                                            //   height: 3,
                                                            //   width: MediaQuery.of(context)
                                                            //       .size
                                                            //       .width /
                                                            //       8,
                                                            //   decoration: BoxDecoration(
                                                            //     borderRadius:
                                                            //     BorderRadius.circular(10),
                                                            //     color: Constant.blueColor,
                                                            //   ),
                                                            // ),
                                                            Container(
                                                              height: 1,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2,
                                                              color: Constant
                                                                  .blueColor,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    favBedItem(
                                                                        "bedrooms"
                                                                            .tr(),
                                                                        "   ${provider.getMyPropertyList[index].bedRooms}",
                                                                        "Assets/bed.svg"),
                                                                    favBedItem(
                                                                        "bathrooms".tr(),
                                                                        "   ${provider.getMyPropertyList[index].bathRooms}",
                                                                        "Assets/bath.svg"),
                                                                  ],
                                                                ),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        Container(
                                                                      // color: Colors.green,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          7,
                                                                      child:
                                                                          CustomText(
                                                                        text: Jiffy(DateTime.fromMillisecondsSinceEpoch(int.parse(provider.properties[index].timeStamp)).toLocal())
                                                                            .fromNow(),
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.4),
                                                                        size: 8,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    )
                                                                    // CustomText(
                                                                    //   text:  Jiffy(DateTime
                                                                    //       .fromMillisecondsSinceEpoch(
                                                                    //       int.parse(provider
                                                                    //           .properties[
                                                                    //       index]
                                                                    //           .timeStamp))
                                                                    //       .toLocal())
                                                                    //       .fromNow(),
                                                                    //   color: Colors.black.withOpacity(0.4),
                                                                    //   size:8,
                                                                    //   fontWeight: FontWeight.w500,
                                                                    // ),
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
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    favBedItem(
                                                                        "livingRooms".tr(),
                                                                        "   ${provider.getMyPropertyList[index].livingRoom}",
                                                                        "Assets/living.svg"),
                                                                    favBedItem(
                                                                        "garage".tr(),
                                                                        "   ${provider.getMyPropertyList[index].parkingSpots}",
                                                                        "Assets/garage.svg"),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "Assets/priceTag.png",
                                                                      height: 16,
                                                                    ),
                                                                    CustomText(
                                                                      text:
                                                                          "${provider.getMyPropertyList[index].price.length > 6 ? "${provider.getMyPropertyList[index].price.substring(0, 5)}.." : provider.getMyPropertyList[index].price}KWD",
                                                                      color: Constant
                                                                          .blueColor,
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditPropertyPage(
                                                                    provider.getMyPropertyList[
                                                                        index])));
                                                  },
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: SvgPicture.asset(
                                                        "Assets/editp.svg",
                                                        height: 16,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  typeItem(String title, int current, int selected, Function ontap) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: ontap,
        child: AnimatedContainer(
          duration: new Duration(seconds: 1),
          height: current == selected ? 35 : 30,
          width: current == selected
              ? MediaQuery.of(context).size.width / 3.8
              : MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: current == selected
                  ? Constant.blueColor
                  : Colors.grey.withOpacity(0.3),
              border: Border.all(
                color: current == selected
                    ? Constant.darkblue.withOpacity(0.8)
                    : Colors.black.withOpacity(0.3),
              )),
          child: Center(
            child: CustomText(
              text: title,
              color: current == selected
                  ? Colors.white
                  : Colors.black.withOpacity(0.3),
              size: current == selected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
