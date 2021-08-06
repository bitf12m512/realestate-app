import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/fiter.dart';
import 'package:realestate/Classes/fiter.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/bottom_nav_page/Filter/filter_page.dart';
import 'package:realestate/bottom_nav_page/Filter/search_property_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cats = [
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
    "Assets/appartment.svg",
    "Assets/condos.svg",
    "Assets/studio.svg",
    "Assets/Farm.svg",
    "Assets/Office.svg",
    "Assets/Storages.svg",
    "Assets/recreational.svg",
    "Assets/homeicon.svg",
  ];
  List avaiableIcons = [
    "Assets/house.svg",
    "Assets/buy.svg",
    "Assets/exchange.svg",
    "Assets/all.svg"
  ];

  int selectedView = 0;
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<RoleIdentifier>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "Assets/BG.png",
                        )),
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: "Find best place",
                                  size: 26,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: " nearby",
                                  size: 26,
                                  color: Constant.blueColor.withOpacity(0.8),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Constant.darkblue,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){

                                         Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (context) =>
                                                SearchPropertyPage()));
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            text: "Search Your Position",
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Filter filter = new Filter();
                                        filter = await Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    FilterPage()));
                                      if(filter!=null){
                                        setFilter(filter);
                                      }
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.2,
                                        decoration: BoxDecoration(
                                            color: Constant.blueColor,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Filter  ",
                                              size: 12,
                                              color: Colors.white,
                                            ),
                                            SvgPicture.asset(
                                              "Assets/filter.svg",
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 7.8,
                      //   width: MediaQuery.of(context).size.width,
                      //   // color: Colors.amber,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: cats.length,
                      //       itemBuilder: (context, index) {
                      //         return Padding(
                      //           padding: const EdgeInsets.only(left: 20.0),
                      //           child: Container(
                      //             height:
                      //                 MediaQuery.of(context).size.height / 7.8,
                      //             width: MediaQuery.of(context).size.height / 9,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(10),
                      //               border: Border.all(
                      //                   color:
                      //                       Color(0xff3B3B6A).withOpacity(0.2),
                      //                   width: 3),
                      //               gradient: LinearGradient(
                      //                 begin: Alignment.topLeft,
                      //                 end: Alignment.bottomRight,
                      //                 stops: [0.1, 0.9],
                      //                 colors: [
                      //                   Color(0xff4570AF),
                      //                   Color(0xff3B3B6A),
                      //                 ],
                      //               ),
                      //             ),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Container(
                      //                     height: MediaQuery.of(context)
                      //                             .size
                      //                             .height /
                      //                         13,
                      //                     width: MediaQuery.of(context)
                      //                             .size
                      //                             .height /
                      //                         15,
                      //                     child: SvgPicture.asset(
                      //                       catsImages[index],
                      //                       color: Colors.white,
                      //                     )),
                      //                 SizedBox(
                      //                   height: 3,
                      //                 ),
                      //                 Expanded(
                      //                   child: CustomText(
                      //                     text: cats[index],
                      //                     alignemnt: TextAlign.center,
                      //                     size: 11,
                      //                     color: Colors.white,
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            typeItem(context, "All", avaiableIcons[3]),
                            typeItem(context, "Rent", avaiableIcons[0]),
                            typeItem(context, "Buy", avaiableIcons[1]),
                            typeItem(context, "Exchange", avaiableIcons[2]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    var provider =
                        Provider.of<RoleIdentifier>(context, listen: false);
                    provider.setPropertyList([]);
                    for (int i = 0;
                        i < provider.getPropertyBackList.length;
                        i++) {
                      // if(provider.getPropertyBackList[i].availableFor.toLowerCase()==title.toLowerCase()){
                      provider
                          .addTOProprertyList(provider.getPropertyBackList[i]);
                      // }

                    }
                    setState(() {
                      selectedCategory = "";
                    });
                    return;
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                listGridOption("Assets/listview.svg", "1x1", 0,
                                    selectedView, () {
                                  setState(() {
                                    selectedView = 0;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                listGridOption("Assets/gridviewicon.svg", "2x2",
                                    1, selectedView, () {
                                  setState(() {
                                    selectedView = 1;
                                  });
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              color: Colors.black.withOpacity(0.4),
                              thickness: 1,
                            ),
                          ),
                          selectedView == 0 ? listView() : gridview(),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget typeItem(BuildContext context, String title, String icon) {
    return GestureDetector(
      onTap: () {
        var provider = Provider.of<RoleIdentifier>(context, listen: false);
        provider.setPropertyList([]);
        if(title=="All"){
          for (int i = 0; i < provider.getPropertyBackList.length; i++) {
            // if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
            //     title.toLowerCase()) {
              provider.addTOProprertyList(provider.getPropertyBackList[i]);
            // }
          }
        }
        else{
          for (int i = 0; i < provider.getPropertyBackList.length; i++) {
            if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
                title.toLowerCase()) {
              provider.addTOProprertyList(provider.getPropertyBackList[i]);
            }
          }
        }

        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        // height: 25,
        width: MediaQuery.of(context).size.width / 4.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: selectedCategory == title
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
                text: title,
                color: Colors.white,
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  listGridOption(
      String image, String title, int current, int selected, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            height: 18,
            color: current == selected
                ? Colors.black
                : Colors.black.withOpacity(0.4),
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: title,
            color: current == selected
                ? Colors.black
                : Colors.black.withOpacity(0.4),
            height: 1.2,
            size: 11,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }

  bedGridItem(String title, String val, String image) {
    return Container(
      height: 30,
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: Colors.black.withOpacity(0.3),
            size: 6,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                image,
                height: 12,
              ),
              CustomText(
                text: val,
                color: Colors.black.withOpacity(0.7),
                size: 8,
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
    );
  }

  listView() {
    return Consumer<RoleIdentifier>(builder: (context, provider, child) {
      return Column(
        children: [
          provider.getPropertyList.length == 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0, left: 15, right: 15),
                      child: Container(
                        height: 1000,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomText(
                            text: "No Properties found",
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    );
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.getPropertyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0, left: 15, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PropertyDetailPage(
                                  provider.properties[index],false)));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
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
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20)),
                                              child: Image.network(
                                                provider.properties[index]
                                                    .images[0],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0.1, 0.5, 0.7, 0.9],
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.black.withOpacity(0.6),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 100),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text: provider
                                                        .properties[index].name,
                                                    color: Colors.white,
                                                    size: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  Container(
                                                    height: 3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            8,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Constant.blueColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    color: Constant.blueColor,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              bedItem(
                                                  "Bedrooms",
                                                  "   ${provider.properties[index].bedRooms}",
                                                  "Assets/bed.svg"),
                                              bedItem(
                                                  "Bathrooms",
                                                  "   ${provider.properties[index].bathRooms}",
                                                  "Assets/bath.svg"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              bedItem(
                                                  "Living Rooms",
                                                  "   ${provider.properties[index].livingRoom}",
                                                  "Assets/living.svg"),
                                              bedItem(
                                                  "Garage",
                                                  "   ${provider.properties[index].parkingSpots}",
                                                  "Assets/garage.svg"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "Assets/priceTag.png",
                                                    height: 20,
                                                  ),
                                                  CustomText(
                                                    text:
                                                        "  ${provider.properties[index].price} KWD",
                                                    color: Constant.blueColor,
                                                    size: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                              CustomText(
                                                text: Jiffy(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                int.parse(provider
                                                                    .properties[
                                                                        index]
                                                                    .timeStamp))
                                                        .toLocal())
                                                    .fromNow(),
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                size: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: () async {
                                          List favs = [];
                                          for (int i = 0;
                                              i <
                                                  provider
                                                      .favouriteIdies.length;
                                              i++) {
                                            favs.add(
                                                provider.favouriteIdies[i]);
                                          }
                                          if (favs.contains(
                                              provider.properties[index].id)) {
                                            favs.remove(
                                                provider.properties[index].id);
                                          } else {
                                            favs.add(
                                                provider.properties[index].id);
                                          }
                                          await FirebaseDatabase.instance
                                              .reference()
                                              .child("Users")
                                              .child(
                                                  Provider.of<RoleIdentifier>(
                                                          context,
                                                          listen: false)
                                                      .appuser
                                                      .id)
                                              .update({"favourites": favs});
                                        },
                                        child: Icon(
                                          provider.favouriteIdies.contains(
                                                  provider.properties[index].id)
                                              ? Icons.favorite
                                              : Icons.favorite_border_rounded,
                                          color: Constant.blueColor,
                                          size: 30,
                                        ))),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
          SizedBox(
            height: 70,
          )
        ],
      );
    });
  }

  gridview() {
    return Consumer<RoleIdentifier>(builder: (context, provider, child) {
      return provider.getPropertyList.length == 0
          ? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30.0, left: 15, right: 15),
                  child: Container(
                    height: 1000,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CustomText(
                        text: "No Properties found",
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                );
              })
          : GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3.4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: provider.properties.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index % 2 == 0 ? 15.0 : 0,
                      right: index % 2 == 1 ? 15.0 : 0,
                      bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PropertyDetailPage(provider.properties[index],false)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 1),
                                    // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                            child: Image.network(
                                              provider
                                                  .properties[index].images[0],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.1, 0.5, 0.7, 0.9],
                                              colors: [
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.6),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: provider
                                                      .properties[index].name,
                                                  color: Colors.white,
                                                  size: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          bedGridItem(
                                              "Bedrooms",
                                              "   ${provider.properties[index].bedRooms}",
                                              "Assets/bed.svg"),
                                          bedGridItem(
                                              "Bathrooms",
                                              "   ${provider.properties[index].bathRooms}",
                                              "Assets/bath.svg"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          bedGridItem(
                                              "Living Rooms",
                                              "   ${provider.properties[index].livingRoom}",
                                              "Assets/living.svg"),
                                          bedGridItem(
                                              "Garage",
                                              "   ${provider.properties[index].parkingSpots}",
                                              "Assets/garage.svg"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "Assets/priceTag.png",
                                                height: 12,
                                              ),
                                              CustomText(
                                                text:
                                                    "${provider.properties[index].price.length > 5 ? "${provider.properties[index].price.substring(0, 5)}..." : provider.properties[index].price}KWD",
                                                color: Constant.blueColor,
                                                size: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 17,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            // color: Colors.green,
                                            child: CustomText(
                                              text: Jiffy(DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              int.parse(provider
                                                                  .properties[
                                                                      index]
                                                                  .timeStamp))
                                                      .toLocal())
                                                  .fromNow(),
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              size: 7.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                    onTap: () async {
                                      List favs = [];
                                      for (int i = 0;
                                          i < provider.favouriteIdies.length;
                                          i++) {
                                        favs.add(provider.favouriteIdies[i]);
                                      }
                                      if (favs.contains(
                                          provider.properties[index].id)) {
                                        favs.remove(
                                            provider.properties[index].id);
                                      } else {
                                        favs.add(provider.properties[index].id);
                                      }
                                      await FirebaseDatabase.instance
                                          .reference()
                                          .child("Users")
                                          .child(Provider.of<RoleIdentifier>(
                                                  context,
                                                  listen: false)
                                              .appuser
                                              .id)
                                          .update({"favourites": favs});
                                      // print(provider.favouriteIdies.length);
                                      // print(".......after.......");
                                    },
                                    child: Icon(
                                      provider.favouriteIdies.contains(
                                              provider.properties[index].id)
                                          ? Icons.favorite
                                          : Icons.favorite_border_rounded,
                                      color: Constant.blueColor,
                                      size: 25,
                                    ))),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
    });
  }

  void setFilter(Filter filter) {
    var provider = Provider.of<RoleIdentifier>(context, listen: false);
    provider.setPropertyList([]);
    for (int i = 0; i < provider.getPropertyBackList.length; i++) {
      bool match = false;
      if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
          filter.availableFor.toLowerCase()) {
        if (provider.getPropertyBackList[i].mainType.toLowerCase() ==
            filter.mainCategory.toLowerCase()) {
          if (filter.priceEnd != "") {
            if (double.parse(provider.getPropertyBackList[i].price) <
                    double.parse(filter.priceEnd) &&
                double.parse(provider.getPropertyBackList[i].price) >
                    double.parse(filter.priceStart)) {
              match=true;
            }
            // else{
            //
            // }
          }
          // if (filter.areaEnd != "") {
          //   if (double.parse(provider.getPropertyBackList[i].) <
          //           double.parse(filter.priceEnd) &&
          //       double.parse(provider.getPropertyBackList[i].price) >
          //           double.parse(filter.priceStart)) {
          //     match=true;
          //   }
          // }
          if(filter.bedrooms!=0){
            if(filter.bedrooms==provider.getPropertyBackList[i].bedRooms){
              match=true;
            }
            else{
              match=false;
            }
          }

          if(filter.masterRooms!=0){
            if(filter.masterRooms==provider.getPropertyBackList[i].masterBed){
              match=true;
            }
            else{
              match=false;
            }
          }

          if(filter.bathRooms!=0){
            if(filter.bathRooms==provider.getPropertyBackList[i].bathRooms){
              match=true;
            }
            else{
              match=false;
            }
          }

          if(filter.parkingSpots!=0){
            if(filter.parkingSpots==provider.getPropertyBackList[i].parkingSpots){
              match=true;
            }
            else{
              match=false;
            }
          }

if(filter.maidRoom==true){
  if(filter.maidRoom==provider.getPropertyBackList[i].maiRoom){
    match=true;
  }
  else{
    match=false;
  }
}
         if(filter.swimmingPool==true){
           if(filter.swimmingPool==provider.getPropertyBackList[i].swimmingPool){
             match=true;
           }
           else{
             match=false;
           }
         }
         if(filter.centralAC==true){
           if(filter.centralAC==provider.getPropertyBackList[i].centralAc){
             match=true;
           }
           else{
             match=false;
           }
         }
         if(filter.elevator==true){
           if(filter.elevator==provider.getPropertyBackList[i].elevator){
             match=true;
           }
           else{
             match=false;
           }
         }

        }
      }
      if(match==true){
        provider.addTOProprertyList(provider.getPropertyBackList[i]);
      }
    }
    setState(() {

    });
  }
}
