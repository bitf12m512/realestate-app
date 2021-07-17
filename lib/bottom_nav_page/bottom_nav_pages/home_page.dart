import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/bottom_nav_page/Filter/filter_page.dart';
import 'package:realestate/bottom_nav_page/bottom_nav_pages/property_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cats = ["Apartments", "Studio", "Flats", "House"];
  List catsImages = [
    "Assets/appartment.svg",
    "Assets/studio.svg",
    "Assets/flats.svg",
    "Assets/homeicon.svg"
  ];
  int selectedView = 0;

  @override
  Widget build(BuildContext context) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                GestureDetector(
                                 onTap: (){

                                   Navigator.of(context).push(
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               FilterPage()));
                                 },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 4.2,
                                    decoration: BoxDecoration(
                                        color: Constant.blueColor,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    height: MediaQuery.of(context).size.height / 7.8,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.amber,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cats.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 7.8,
                              width: MediaQuery.of(context).size.height / 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xff3B3B6A).withOpacity(0.2),
                                    width: 3),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xff4570AF),
                                    Color(0xff3B3B6A),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              13,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      child: SvgPicture.asset(
                                        catsImages[index],
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                    text: cats[index],
                                    size: 12,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        typeItem(context, "Rent", () {}),
                        typeItem(context, "Buy", () {}),
                        typeItem(context, "Exchange", () {}),
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
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: Row(
                        children: [
                          listGridOption(
                              "Assets/listview.svg", "1x1", 0, selectedView, () {
                            setState(() {
                              selectedView = 0;
                            });
                          }),
                          SizedBox(
                            width: 10,
                          ),
                          listGridOption(
                              "Assets/gridviewicon.svg", "2x2", 1, selectedView,
                              () {
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
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.4),
                        thickness: 1,
                      ),
                    ),
                 selectedView==0?listView():gridview(),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget typeItem(BuildContext context, String title, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 25,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Constant.blueColor),
        child: Center(
          child: CustomText(
            text: title,
            color: Colors.white,
            size: 12,
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
    return   Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom:30.0,left: 15,right: 15),
                child: GestureDetector(
                  onTap: (){

                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                PropertyDetailPage()));
                  },
                  child: Container(
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
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                height:
                                MediaQuery.of(context).size.height /
                                    6,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  child: Image.asset(
                                    "Assets/homes@3x.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                MediaQuery.of(context).size.height /
                                    6,
                                width: MediaQuery.of(context).size.width,
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
                                        text: "House in Jabriya Block 6",
                                        color: Colors.white,
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Container(
                                        height: 3,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Constant.blueColor,
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        width: MediaQuery.of(context)
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
                                  bedItem("Bedrooms", "   03",
                                      "Assets/bed.svg"),
                                  bedItem("Bathrooms", "   04",
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
                                  bedItem("Living Rooms", "   12",
                                      "Assets/living.svg"),
                                  bedItem("Garage", "   01",
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
                                      Image.asset("Assets/priceTag.png",height: 20,),
                                      CustomText(
                                        text: "  450 KWD",
                                        color: Constant.blueColor,
                                        size: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: "8 hours age",
                                    color: Colors.black.withOpacity(0.4),
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
                ),
              );
            }),
        SizedBox(
          height: 70,
        )
      ],
    );
  }

  gridview() {
    return GridView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
        SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 /3.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 7,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding:  EdgeInsets.only(left:index%2==0?15.0:0,right:index%2==1?15.0:0 ),

            child: GestureDetector(
              onTap: (){

                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyDetailPage()));
              },
              child: Container(
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
                      height: MediaQuery.of(context).size.height / 9,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                            height:
                            MediaQuery.of(context).size.height /
                                9,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              child: Image.asset(
                                "Assets/homes@3x.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height:
                            MediaQuery.of(context).size.height /
                                9,
                            width: MediaQuery.of(context).size.width,
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
                              padding: const EdgeInsets.only(left:5.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "House in Jabriya Block 6",
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
                              bedGridItem("Bedrooms", "   03",
                                  "Assets/bed.svg"),
                              bedGridItem("Bathrooms", "   04",
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
                              bedGridItem("Living Rooms", "   12",
                                  "Assets/living.svg"),
                              bedGridItem("Garage", "   01",
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
                                  Image.asset("Assets/priceTag.png",height: 12,),
                                  CustomText(
                                    text: " 450 KWD",
                                    color: Constant.blueColor,
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              CustomText(
                                text: "8 hours age",
                                color: Colors.black.withOpacity(0.4),
                                size: 8,
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
            ),
          );
        });
  }
}
