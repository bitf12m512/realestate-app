import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
        roundedAppBar(context,"Favourites"),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 15),
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
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width/3,
                                child: Container(
                                  height:
                                  MediaQuery.of(context).size.height /
                                      5,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    child: Image.asset(
                                      "Assets/homes@3x.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        text: "House in Jabriya Block 6",
                                        color: Colors.black,
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
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              favBedItem("Bedrooms", "   03",
                                                  "Assets/bed.svg"),
                                              favBedItem("Bathrooms", "   04",
                                                  "Assets/bath.svg"),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: CustomText(
                                              text: "8 hours age",
                                              color: Colors.black.withOpacity(0.4),
                                              size:8,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                                            MainAxisAlignment.start,
                                            children: [
                                              favBedItem("Living Rooms", "   12",
                                                  "Assets/living.svg"),
                                              favBedItem("Garage", "   01",
                                                  "Assets/garage.svg"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(""),
                                              CustomText(
                                                text: " 450 KWD",
                                                color: Constant.blueColor,
                                                size: 12,
                                                fontWeight: FontWeight.w500,
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
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite,color: Colors.red,)),
                        )
                      ],
                    ),
                  ),
                ) ;
              }),
            ),
          )
        ],
      ),
    );
  }


}
