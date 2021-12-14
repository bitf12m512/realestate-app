import 'package:auto_direction/auto_direction.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/no_property_found.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/edit_property/edit_property.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';
import 'package:easy_localization/easy_localization.dart';
class FavouritesPage extends StatefulWidget {
  ScrollController controller1;
  FavouritesPage(this.controller1);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoleIdentifier>(builder: (context, provider, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            roundedAppBar(context, "Favourites".tr()),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: provider.favouriteIdies.length == 0
                    ? noPropertyFoundWidget(
                        context, "No Favourite Properties found".tr())
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: provider.properties.length == 0
                            ? noPropertyFoundWidget(
                                context, "No Favourite Properties found".tr())
                            : ListView.builder(
                          controller: widget.controller1,
                                itemCount: provider.properties.length,
                                itemBuilder: (context, index) {
                                  return provider.favouriteIdies.contains(
                                          provider.properties[index].id)
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15,
                                              bottom: 15),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PropertyDetailPage(
                                                              provider.properties[
                                                                  index],
                                                              false)));
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context).size.height / 4.5,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              4.5,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4.5,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15)),
                                                              child:
                                                                  Image.network(
                                                                provider
                                                                    .properties[
                                                                        index]
                                                                    .images[0],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              // color: Colors.green,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 33,
                                                                  ),
                                                                  AutoDirection(
                                                                    text: provider
                                                                        .properties[
                                                                    index]
                                                                        .name,
                                                                    child: CustomText(
                                                                      text: provider
                                                                          .properties[
                                                                              index]
                                                                          .name.length>24?"${provider
                                                                          .properties[
                                                                      index]
                                                                          .name.substring(0,23)}...":provider
                                                                          .properties[
                                                                      index]
                                                                          .name,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                  // Container(
                                                                  //   height: 3,
                                                                  //   width: MediaQuery.of(
                                                                  //               context)
                                                                  //           .size
                                                                  //           .width /
                                                                  //       8,
                                                                  //   decoration:
                                                                  //       BoxDecoration(
                                                                  //     borderRadius:
                                                                  //         BorderRadius
                                                                  //             .circular(
                                                                  //                 10),
                                                                  //     color: Constant
                                                                  //         .blueColor,
                                                                  //   ),
                                                                  // ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Container(
                                                                    height: 1,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2,
                                                                    color: Constant
                                                                        .blueColor,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
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
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          favBedItem(
                                                                              "bedrooms".tr(),
                                                                              "   ${provider.properties[index].bedRooms}",
                                                                              "Assets/bed.svg"),
                                                                          favBedItem(
                                                                              "bathrooms".tr(),
                                                                              "    ${provider.properties[index].bathRooms}",
                                                                              "Assets/bath.svg"),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        child:
                                                                            Container(
                                                                              // color: Colors.green,
                                                                              width: MediaQuery.of(context).size.width/7,
                                                                              child: CustomText(
                                                                              text:
                                                                                Jiffy(

                                                                                    DateTime.fromMillisecondsSinceEpoch(int.parse(provider.properties[index].timeStamp)).toLocal()).fromNow(),
                                                                              color:
                                                                                Colors.black.withOpacity(0.4),
                                                                              size:
                                                                                8,
                                                                              fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            favBedItem(
                                                                                "livingRooms".tr(),
                                                                                "    ${provider.properties[index].livingRoom}",
                                                                                "Assets/living.svg"),
                                                                            favBedItem(
                                                                                "garage".tr(),
                                                                                "    ${provider.properties[index].parkingSpots}",
                                                                                "Assets/garage.svg"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            //   Image.asset(
                                                                            //   "Assets/priceTag.png",
                                                                            //   height: 14,
                                                                            // ),
                                                                            CustomText(
                                                                              text: "${provider.properties[index].price.length > 6 ? "${provider.properties[index].price.substring(0, 5)}.." : provider.properties[index].price}${'kwd'.tr()}",

                                                                              // text:
                                                                              //     "${provider.properties[index].price}KWD",
                                                                              color: Constant.blueColor,
                                                                              size: 8.5,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Container(
                                                          height: 28,
                                                          // color: Colors.red,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    List favs =
                                                                        [];
                                                                    for (int i =
                                                                            0;
                                                                        i < provider.favouriteIdies.length;
                                                                        i++) {
                                                                      favs.add(
                                                                          provider
                                                                              .favouriteIdies[i]);
                                                                    }
                                                                    if (favs.contains(provider
                                                                        .properties[
                                                                            index]
                                                                        .id)) {
                                                                      favs.remove(provider
                                                                          .properties[
                                                                              index]
                                                                          .id);
                                                                    } else {
                                                                      favs.add(provider
                                                                          .properties[
                                                                              index]
                                                                          .id);
                                                                    }
                                                                    await FirebaseDatabase
                                                                        .instance
                                                                        .reference()
                                                                        .child(
                                                                            "Users")
                                                                        .child(Provider.of<RoleIdentifier>(context, listen: false)
                                                                            .appuser
                                                                            .id)
                                                                        .update({
                                                                      "favourites":
                                                                          favs
                                                                    });
                                                                    // print(provider.favouriteIdies.length);
                                                                    // print(".......after.......");
                                                                  },
                                                                  child: Icon(
                                                                    provider.favouriteIdies.contains(provider
                                                                            .properties[
                                                                                index]
                                                                            .id)
                                                                        ? Icons
                                                                            .favorite
                                                                        : Icons
                                                                            .favorite_border_rounded,
                                                                    color: Constant
                                                                        .blueColor,
                                                                    size: 25,
                                                                  )),
                                                              provider.getMyProductsidies
                                                                      .contains(provider
                                                                          .properties[
                                                                              index]
                                                                          .id)
                                                                  ? Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              2.0),
                                                                      child: Align(
                                                                          alignment: Alignment.topLeft,
                                                                          child: InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPropertyPage(provider.getMyPropertyList[index])));
                                                                            },
                                                                            child: Container(
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.white),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(3.0),
                                                                                  child: SvgPicture.asset(
                                                                                    "Assets/editp.svg",
                                                                                    height: 20,
                                                                                  ),
                                                                                )),
                                                                          )),
                                                                    )
                                                                  : Container()
                                                            ],
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container();
                                }),
                      ),
              ),
            )
          ],
        ),
      );
    });
  }
}
