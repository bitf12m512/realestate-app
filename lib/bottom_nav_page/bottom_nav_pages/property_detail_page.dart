import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:provider/provider.dart';
import 'package:realestate/Classes/availability_item.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/manageBiddingNotification.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/bed_item.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:realestate/Widgets/text_field_without_prefix.dart';
import 'package:toast/toast.dart';
import 'package:easy_localization/easy_localization.dart';
class PropertyDetailPage extends StatefulWidget {
  Property property;
  bool myAddsPage;

  PropertyDetailPage(this.property,
      this.myAddsPage); // const PropertyDetailPage({Key key}) : super(key: key);

  @override
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  CarouselController _carouselController = new CarouselController();
  List images = ["Assets/homes@3x.png", "Assets/sampleb@3x.png"];
  TextEditingController phone = new TextEditingController();
  TextEditingController notes = new TextEditingController();
  TextEditingController name = new TextEditingController();
  AvailabilityItem availabilityItem = new AvailabilityItem();
  String dateOfAvailability = null;
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  bool furnitureMovingService = false;
  String phoneN="";

  @override
  void initState() {
    // TODO: implement initState
    setDataL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoleIdentifier>(builder: (context, provider, child) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NestedScrollView(
              // controller: _scrollViewController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
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
                              items: widget.property.images.map((i) {
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
                                            MediaQuery.of(context).size.width,
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
                                              placeholder: AssetImage(
                                                  "Assets/download.png"),
                                              image: NetworkImage(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (widget.myAddsPage == true) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.black
                                                    .withOpacity(0.3)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.arrow_back_ios_rounded,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                List favs = [];
                                                for (int i = 0;
                                                    i <
                                                        provider.favouriteIdies
                                                            .length;
                                                    i++) {
                                                  favs.add(provider
                                                      .favouriteIdies[i]);
                                                }
                                                if (favs.contains(
                                                    widget.property.id)) {
                                                  favs.remove(
                                                      widget.property.id);
                                                } else {
                                                  favs.add(widget.property.id);
                                                }
                                                await FirebaseDatabase.instance
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
                                                if (favs.contains(widget.property.id)) {

                                                  SendLikeNotification(
                                                      context,
                                                      [widget.property.creatorId],
                                                      widget.property.name);
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    provider.favouriteIdies
                                                            .contains(widget
                                                                .property.id)
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_border_rounded,
                                                    color: provider
                                                            .favouriteIdies
                                                            .contains(widget
                                                                .property.id)
                                                        ? Constant.blueColor
                                                        : Colors.white,
                                                    size: 28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            // Container(
                                            //   decoration: BoxDecoration(
                                            //       borderRadius:
                                            //           BorderRadius.circular(4),
                                            //       color: Colors.black
                                            //           .withOpacity(0.3)),
                                            //   child: Padding(
                                            //     padding:
                                            //         const EdgeInsets.all(6.0),
                                            //     child: SvgPicture.asset(
                                            //       "Assets/sharen.svg",
                                            //       height: 27,
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        next(Icons.arrow_back_ios_rounded, () {
                                          setState(() {
                                            _carouselController.previousPage();
                                          });
                                        }),
                                        next(Icons.arrow_forward_ios_rounded,
                                            () {
                                          setState(() {
                                            _carouselController.nextPage();
                                          });
                                        }),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(5),
                                          //     color: Colors.black.withOpacity(0.2)),
                                          // child: Padding(
                                          //   padding: const EdgeInsets.all(6.0),
                                          //   child: SvgPicture.asset(
                                          //     "Assets/camn.svg",
                                          //     height: 25,
                                          //   ),
                                          // ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.black
                                                  .withOpacity(0.3)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: CustomText(
                                              text:
                                                  "${widget.property.price}${" "+'kwd'.tr()}",
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              size: 22,
                                            ),
                                          ),
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
                  ),
                ];
              },
              body: SingleChildScrollView(
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
                              text: widget.property.name,
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
                                              detailBedItem(
                                                  "bedrooms".tr(),
                                                  "   ${widget.property.bedRooms}",
                                                  "Assets/bed.svg"),
                                              detailBedItem(
                                                  "maidRoom".tr(),
                                                  "   ${widget.property.maiRoom == true ? "Yes" : "No"}",
                                                  "Assets/maid.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem(
                                                  "materBedRoom".tr(),
                                                  "   ${widget.property.masterBed}",
                                                  "Assets/bed.svg"),
                                              detailBedItem(
                                                  "swimmingPool".tr(),
                                                  "   ${widget.property.swimmingPool == true ? "Yes" : "No"}",
                                                  "Assets/water.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem(
                                                  "livingRooms".tr(),
                                                  "   ${widget.property.livingRoom}",
                                                  "Assets/living.svg"),
                                              detailBedItem(
                                                  "floors".tr(),
                                                  "   ${widget.property.floors}",
                                                  "Assets/area2.svg"),
                                              // detailBedItem("Area", "   ${widget.property.bathRooms}",
                                              //     "Assets/area.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem(
                                                  "garage".tr(),
                                                  "   ${widget.property.parkingSpots}",
                                                  "Assets/garage.svg"),
                                              detailBedItem(
                                                  "bathrooms".tr(),
                                                  "   ${widget.property.bathRooms}",
                                                  "Assets/bath.svg"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              detailBedItem(
                                                  "elevator".tr(),
                                                  "   ${widget.property.elevator == true ? "yes".tr() : "no".tr()}",
                                                  "Assets/elevator.svg"),
                                              detailBedItem(
                                                  "centralAc".tr(),
                                                  "   ${widget.property.centralAc == true ? "yes".tr() : "no".tr()}",
                                                  "Assets/locat.svg"),
                                            ],
                                          ),
                                          CustomText(
                                            text: "description".tr(),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: widget.property.description,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text: "area".tr(),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text:
                                                "${widget.property.area} ${'sqft'.tr()}",
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text: "availableFor".tr(),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: widget.property.availableFor.toLowerCase().tr(),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text: "governorate".tr(),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: widget.property.governorate.tr(),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text: "district".tr(),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: widget.property.district.tr(),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                                    "${'positionOd'.tr()} ${widget.property.position.tr()}",
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
                                      text: "detail".tr(),
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
                        if (Provider.of<RoleIdentifier>(context, listen: false)
                            .getMyProductsidies
                            .contains(widget.property.id))
                          Container()
                        else
                          widget.property.mainType.toLowerCase()=="recreational"||
                          widget.property.mainType.toLowerCase()=="chalets"?
                          ContactWidget():   avaiabilityWidget(),
                        SizedBox(
                          height: 15,
                        ),
                        // SizedBox(
                        //   height: 200,
                        // ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      );
    });
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

  dateItem(String val) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        DatePicker.showDatePicker(context,
            showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
          availabilityItem.moveInTimeStamp =
              date.toUtc().millisecondsSinceEpoch.toString();
          var inputDate = DateTime.parse(date.toString());
          var format = DateFormat('dd/MM/yyyy hh:mm a');
          dateOfAvailability = format.format(date);
        }, locale: LocaleType.en);
      },
      child: Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.7))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: val,
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
      ),
    );
  }

  void setDataL() {
    var provider=Provider.of<RoleIdentifier>(context,listen: false);
    availabilityItem.property = widget.property;
    print(widget.property.creatorId);
    print("this is the creator id");
    for(int i=0;i<provider.allUsers.length;i++){
      print(provider.allUsers[i].toMap());
      if(provider.allUsers[i].id==widget.property.creatorId){
        print(provider.allUsers[i].phoneNumber);
        phoneN=provider.allUsers[i].phoneNumber;
        break;
      }
    }
    if(provider.appuser.lastName!=null){
      name.text="${provider.appuser.firstName} ${provider.appuser.lastName}";
    }  if(provider.appuser.phoneNumber!=null){
      phone.text=provider.appuser.phoneNumber;
    }
    setState(() {});
  }

  avaiabilityWidget() {
   var provider=Provider.of<RoleIdentifier>(context,listen: false);
    return
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
                    borderRadius:
                    BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: Constant.blueColor)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            CustomText(
                              text: "Move-in-Date".tr(),
                              size: 14,
                              color: Colors.black
                                  .withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              children: [
                                dateItem(
                                    dateOfAvailability !=
                                        null
                                        ? dateOfAvailability
                                        .substring(
                                        0, 2)
                                        : "00"),
                                dateItem(
                                    dateOfAvailability !=
                                        null
                                        ? dateOfAvailability
                                        .substring(
                                        3, 5)
                                        : "00"),
                                dateItem(
                                    dateOfAvailability !=
                                        null
                                        ? dateOfAvailability
                                        .substring(
                                        8, 10)
                                        : "00"),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                FocusScopeNode
                                currentFocus =
                                FocusScope.of(
                                    context);

                                if (!currentFocus
                                    .hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                DatePicker.showDatePicker(
                                    context,
                                    showTitleActions:
                                    true,
                                    onChanged: (date) {},
                                    onConfirm: (date) {
                                      availabilityItem
                                          .moveInTimeStamp =
                                          date
                                              .toUtc()
                                              .millisecondsSinceEpoch
                                              .toString();
                                      var inputDate =
                                      DateTime.parse(date
                                          .toString());
                                      var format = DateFormat(
                                          'dd/MM/yyyy hh:mm a');
                                      // print();
                                      dateOfAvailability =
                                          format.format(date);
                                    }, locale: LocaleType.en);
                              },
                              child: SvgPicture.asset(
                                "Assets/calender.svg",
                                height: 25,
                                color: Colors.black
                                    .withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithOutPrefix(
                            context,
                            "",
                            "name".tr(),
                            true,
                            name,
                            TextInputType.text,
                            30),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithOutPrefix(
                            context,
                            "",
                            "phoneNumber".tr(),
                            true,
                            phone,
                            TextInputType.phone,
                            14),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithOutPrefix(
                            context,
                            "",
                            "Notes".tr(),
                            true,
                            notes,
                            TextInputType.text,
                            10000),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              furnitureMovingService =
                              !furnitureMovingService;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                furnitureMovingService ==
                                    true
                                    ? Icons
                                    .check_box_outlined
                                    : Icons
                                    .check_box_outline_blank,
                                size: 24,
                                color: Colors.black
                                    .withOpacity(0.6),
                              ),
                              CustomText(
                                text:
                                "Furniture moving service".tr(),
                                size: 14,
                                color: Colors.black
                                    .withOpacity(0.7),
                                fontWeight:
                                FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        sendButton(context,() async {
                          if (dateOfAvailability !=
                              null) {
                            if (key.currentState
                                .validate()) {
                              try{
                                availabilityItem.name =
                                    name.text.trim();
                                availabilityItem.timeStamp=DateTime.now().toUtc().millisecondsSinceEpoch.toString();
                                availabilityItem
                                    .phoneNumber =
                                    phone.text.trim();
                                availabilityItem
                                    .furnitureMovingService =
                                    furnitureMovingService;
                                String id = FirebaseDatabase
                                    .instance
                                    .reference()
                                    .child(
                                    "AvailabilityRequests")
                                    .push()
                                    .key;
                                availabilityItem
                                    .availabilityItemID = id;
                                availabilityItem.userID =
                                    provider.appuser.id;
                                availabilityItem.notes=notes.text;
                                await FirebaseDatabase
                                    .instance
                                    .reference()
                                    .child(
                                    "AvailabilityRequests")
                                    .child(id)
                                    .set(availabilityItem
                                    .toMap());
                                availabilityItem=new AvailabilityItem();
                                availabilityItem.property=widget.property;
                                dateOfAvailability=null;
                                name.clear();
                                phone.clear();
                                notes.clear();
                                setState(() {
                                });
                                Toast.show(
                                    "Your availability Request has been submitted.".tr(),
                                    context,
                                    duration: 4,
                                    gravity: Toast.TOP);
                              }
                              catch(e){
                                Toast.show(
                                    "errorOccurred".tr(),
                                    context,
                                    duration: 4,
                                    gravity: Toast.TOP);
                              }
                            }
                          } else {
                            Toast.show(
                                "Please Select a Move-in-Date".tr(),
                                context,
                                duration: 4,
                                gravity: Toast.TOP);
                          }
                        })
                      ],
                    ),
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
                  text: "Check Availability".tr(),
                  color:
                  Constant.darkblue.withOpacity(0.8),
                  size: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );

  }

  ContactWidget() {

    var provider=Provider.of<RoleIdentifier>(context,listen: false);


    return
      Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            InkWell(
              onTap: (){
                UrlLauncher.launch('tel:+$phoneN}');
              },
              child: Container(
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
                        borderRadius:
                        BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                            color: Constant.blueColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: key,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 20,
                                  color: Constant.blueColor
                                      .withOpacity(0.8),
                                ),
                                CustomText(
                                  text:"  "+
                                phoneN??"N/A"+"  ",
                                  size: 12,
                                  color: Colors.black
                                      .withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            )
                            // sendButton(context,() async {
                            //   if (dateOfAvailability !=
                            //       null) {
                            //     if (key.currentState
                            //         .validate()) {
                            //       try{
                            //         availabilityItem.name =
                            //             name.text.trim();
                            //         availabilityItem.timeStamp=DateTime.now().toUtc().millisecondsSinceEpoch.toString();
                            //         availabilityItem
                            //             .phoneNumber =
                            //             phone.text.trim();
                            //         availabilityItem
                            //             .furnitureMovingService =
                            //             furnitureMovingService;
                            //         String id = FirebaseDatabase
                            //             .instance
                            //             .reference()
                            //             .child(
                            //             "AvailabilityRequests")
                            //             .push()
                            //             .key;
                            //         availabilityItem
                            //             .availabilityItemID = id;
                            //         availabilityItem.userID =
                            //             provider.appuser.id;
                            //         await FirebaseDatabase
                            //             .instance
                            //             .reference()
                            //             .child(
                            //             "AvailabilityRequests")
                            //             .child(id)
                            //             .set(availabilityItem
                            //             .toMap());
                            //         availabilityItem=new AvailabilityItem();
                            //         availabilityItem.property=widget.property;
                            //         dateOfAvailability=null;
                            //         name.clear();
                            //         phone.clear();
                            //         notes.clear();
                            //         setState(() {
                            //         });
                            //         Toast.show(
                            //             "Your availability Request has been submitted.".tr(),
                            //             context,
                            //             duration: 4,
                            //             gravity: Toast.TOP);
                            //       }
                            //       catch(e){
                            //         Toast.show(
                            //             "errorOccurred".tr(),
                            //             context,
                            //             duration: 4,
                            //             gravity: Toast.TOP);
                            //       }
                            //     }
                            //   } else {
                            //     Toast.show(
                            //         "Please Select a Move-in-Date".tr(),
                            //         context,
                            //         duration: 4,
                            //         gravity: Toast.TOP);
                            //   }
                            // }
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Container(
                height: 25,
                width: 80,
                color: Colors.white,
                child: Center(
                  child: CustomText(
                    text: "Contact".tr(),
                    color:
                    Constant.darkblue.withOpacity(0.8),
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}
