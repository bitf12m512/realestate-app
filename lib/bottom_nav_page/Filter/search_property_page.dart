import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/fiter.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/set_filter.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/Widgets/text_field.dart';
import 'package:realestate/bottom_nav_page/Filter/filter_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';

class SearchPropertyPage extends StatefulWidget {
  const SearchPropertyPage({Key key}) : super(key: key);

  @override
  _SearchPropertyPageState createState() => _SearchPropertyPageState();
}

class _SearchPropertyPageState extends State<SearchPropertyPage> {
  TextEditingController searcher = new TextEditingController();
  ScrollController scrollController = new ScrollController();
 Filter previousFilter=new Filter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RoleIdentifier>(builder: (context, provider, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              roundedAppBarwithBackAndFilter(context, "Search", () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                provider.setPropertyList([]);
                for (int i = 0; i < provider.getPropertyBackList.length; i++) {
                  provider.addTOProprertyList(provider.getPropertyBackList[i]);
                }
                Navigator.pop(context);
              }, () async {
                var provider =
                Provider.of<RoleIdentifier>(
                    context,
                    listen: false);
                provider.setPropertyList([]);
                for (int i = 0;
                i <
                    provider.getPropertyBackList
                        .length;
                i++) {
                  provider.addTOProprertyList(provider
                      .getPropertyBackList[i]);
                }
                // setState(() {
                //   selectedCategory = "";
                // });
                Filter filter = new Filter();
                filter = await Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (context) =>
                        FilterPage(previousFilter)));
                if (filter != null) {
                  previousFilter=filter;
                  setFilter(filter,context);
                  setState(() {
                    // if(provider.)
                    scrollController.animateTo(60,
                        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
                    // .
                  });
                }
              },),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: textField()
                  ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: provider.getPropertyList.length == 0
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: CustomText(
                              text: "No Properties found",
                              size: 16,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          padding: EdgeInsets.only(top: 5),
                          itemCount: provider.getPropertyList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, bottom: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PropertyDetailPage(
                                          provider.getPropertyList[index],
                                          false)));
                                },
                                child: Container(
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15)),
                                                  child: Image.network(
                                                    provider.properties[index]
                                                        .images[0],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                      CustomText(
                                                        text: provider
                                                            .properties[index]
                                                            .name,
                                                        color: Colors.black,
                                                        size: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),

                                                      Container(
                                                        height: 1,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        color:
                                                            Constant.blueColor,
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
                                                                  "Bedrooms",
                                                                  "   ${provider.properties[index].bedRooms}",
                                                                  "Assets/bed.svg"),
                                                              favBedItem(
                                                                  "Bathrooms",
                                                                  "    ${provider.properties[index].bathRooms}",
                                                                  "Assets/bath.svg"),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: CustomText(
                                                              text: Jiffy(DateTime.fromMillisecondsSinceEpoch(int.parse(provider
                                                                          .properties[
                                                                              index]
                                                                          .timeStamp))
                                                                      .toLocal())
                                                                  .fromNow(),
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.4),
                                                              size: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                favBedItem(
                                                                    "Living Rooms",
                                                                    "    ${provider.properties[index].livingRoom}",
                                                                    "Assets/living.svg"),
                                                                favBedItem(
                                                                    "Garage",
                                                                    "    ${provider.properties[index].parkingSpots}",
                                                                    "Assets/garage.svg"),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  6,
                                                              child: CustomText(
                                                                text:
                                                                    "${provider.properties[index].price.length < 6 ? provider.properties[index].price : "${provider.properties[index].price.substring(0, 5)}.."}KWD",
                                                                color: Constant
                                                                    .blueColor,
                                                                size: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
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
                                        padding: const EdgeInsets.all(6.0),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                                onTap: () async {
                                                  List favs = [];
                                                  for (int i = 0;
                                                      i <
                                                          provider
                                                              .favouriteIdies
                                                              .length;
                                                      i++) {
                                                    favs.add(provider
                                                        .favouriteIdies[i]);
                                                  }
                                                  if (favs.contains(provider
                                                      .properties[index].id)) {
                                                    favs.remove(provider
                                                        .properties[index].id);
                                                  } else {
                                                    favs.add(provider
                                                        .properties[index].id);
                                                  }
                                                  await FirebaseDatabase
                                                      .instance
                                                      .reference()
                                                      .child("Users")
                                                      .child(Provider.of<
                                                                  RoleIdentifier>(
                                                              context,
                                                              listen: false)
                                                          .appuser
                                                          .id)
                                                      .update(
                                                          {"favourites": favs});
                                                  // print(provider.favouriteIdies.length);
                                                  // print(".......after.......");
                                                },
                                                child: Icon(
                                                  provider.favouriteIdies
                                                          .contains(provider
                                                              .properties[index]
                                                              .id)
                                                      ? Icons.favorite
                                                      : Icons
                                                          .favorite_border_rounded,
                                                  color: Constant.blueColor,
                                                  size: 25,
                                                ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
  textField() {
    return TextFormField(
      controller: searcher,
      onChanged: (val) {
        // setState(() {
        var provider = Provider.of<RoleIdentifier>(context, listen: false);
        provider.setPropertyList([]);
        for (int i = 0; i < provider.getPropertyBackList.length; i++) {
          if (provider.getPropertyBackList[i].name
                  .toLowerCase()
                  .contains(val.toLowerCase()) ||
              provider.getPropertyBackList[i].district
                  .toLowerCase()
                  .contains(val.toLowerCase()) ||
              provider.getPropertyBackList[i].governorate
                  .toLowerCase()
                  .contains(val.toLowerCase())) {
            provider.addTOProprertyList(provider.getPropertyBackList[i]);
          }
        }
        // });
        // setState(() {
        //   // selectedCategory = title;
        // });
      },
      style: TextStyle(color: Colors.white, fontSize: 16),
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
        LengthLimitingTextInputFormatter(100),
      ],

      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.9),
            size: 25,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical:
                // hinttext.toLowerCase()=="Description".toLowerCase()?10:
                10,
            horizontal:
                // hinttext.toLowerCase()=="Description".toLowerCase()?20:
                15),
        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
        hintText: "Search",
        // labelText: "Search",
        filled: true,
        // isDense: true,
        enabled: true,
        fillColor: Constant.darkblue.withOpacity(0.8),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(1000),
          borderSide: new BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          borderSide: new BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          borderSide: new BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          borderSide: new BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
      // decoration: InputDecoration(
      //   hintStyle: TextStyle(
      //       color: Colors.black.withOpacity(0.3)
      //   ),
      //   hintText:hinttext,
      //   border: new OutlineInputBorder(
      //     borderRadius: new BorderRadius.circular(20.0),
      //     // borderSide: new BorderSide(color:Colors.black.withOpacity(0.3)),
      //     // borderSide: BorderSide(
      //     //   color: Colors.green,
      //     // ),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //     borderRadius: BorderRadius.circular(20.7),
      //   ),
      //   // focusedBorder: InputBorder.none,
      //   // enabledBorder: InputBorder.none,
      //   errorBorder: InputBorder.none,
      //   disabledBorder: InputBorder.none,
      // ),
    );
  }
}
