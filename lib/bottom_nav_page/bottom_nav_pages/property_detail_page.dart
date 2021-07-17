import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/send_button.dart';

class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({Key key}) : super(key: key);

  @override
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  CarouselController _carouselController = new CarouselController();
  List images = ["Assets/homes@3x.png", "Assets/sampleb@3x.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: false,
              pinned: false,
              expandedHeight: 340,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 500,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // currentimageindex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: images.map((i) {
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
                                  child: FadeInImage(
                                      placeholder: AssetImage("download.png"),
                                      image: AssetImage(
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SvgPicture.asset(
                                  "Assets/sharen.svg",
                                  height: 30,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                next(Icons.arrow_back_ios_rounded, () {
                                  setState(() {
                                    _carouselController.previousPage();
                                  });
                                }),
                                next(Icons.arrow_forward_ios_rounded, () {
                                  setState(() {
                                    _carouselController.nextPage();
                                  });
                                }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black.withOpacity(0.2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      "Assets/camn.svg",
                                      height: 25,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: "450 KWD",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  size: 22,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height,
                    //   width: MediaQuery.of(context).size.width,
                    //   // color: Colors.green,
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //       stops: [0.1, 0.5, 0.7, 0.9],
                    //       colors: [
                    //         Colors.black.withOpacity(0.2),
                    //
                    //         Colors.transparent,
                    //         Colors.transparent,
                    //         Colors.black.withOpacity(0.2),
                    //       ],
                    //     ),
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(20),
                    //         bottomRight: Radius.circular(20)),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // leading:
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
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
                            CustomText(
                              text: "House in Jabriya Block 6",
                              // color: Colors.white,
                              size: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width / 8,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Constant.blueColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem("Bedrooms", "   12",
                                                  "Assets/bed.svg"),
                                              detailBedItem("Maid Room",
                                                  "   Yes", "Assets/maid.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem("Master Rooms",
                                                  "   12", "Assets/bed.svg"),
                                              detailBedItem("Swimming Pool",
                                                  "   01", "Assets/water.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem("Living Rooms",
                                                  "   12", "Assets/living.svg"),
                                              detailBedItem("Area", "   01",
                                                  "Assets/area.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem("Garage", "   01",
                                                  "Assets/garage.svg"),
                                              detailBedItem("Bathrooms",
                                                  "   12", "Assets/bath.svg"),
                                            ],
                                          ),
                                          detailBedItem("Floors", "   03",
                                              "Assets/area2.svg"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 20,
                                                color: Constant.blueColor
                                                    .withOpacity(0.8),
                                              ),
                                              CustomText(
                                                text:
                                                    "Position of real Estate | Corner",
                                                size: 12,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Container(
                                  height: 25,
                                  width: 70,
                                  color: Colors.white,
                                  child: Center(
                                    child: CustomText(
                                      text: "Details",
                                      color: Constant.darkblue.withOpacity(0.8),
                                      size: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Constant.blueColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Move-in-Date",
                                                size: 14,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  dateItem(),
                                                  dateItem(),
                                                  dateItem(),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                "Assets/calender.svg",
                                                height: 25,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box_outlined,
                                                size: 24,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                              CustomText(
                                                text:
                                                    "Furniture moving service",
                                                size: 14,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        sendButton(context)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Container(
                                  height: 25,
                                  width: 130,
                                  color: Colors.white,
                                  child: Center(
                                    child: CustomText(
                                      text: "Check Availability",
                                      color: Constant.darkblue.withOpacity(0.8),
                                      size: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // SizedBox(
                        //   height: 200,
                        // ),
                      ],
                    ),
                  )),
            )
          ],
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
}
