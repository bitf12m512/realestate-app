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
class NotificationsListPage extends StatefulWidget {
  // const NotificationsListPage({Key key}) : super(key: key);

  @override
  _NotificationsListPageState createState() => _NotificationsListPageState();
}

class _NotificationsListPageState extends State<NotificationsListPage> {
  int selected = 1;

  @override
  void initState() {
    // TODO: implement initState
    setImages();
    super.initState();
  }

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
                roundedAppBarwithBack(context, "notifications".tr(), () {
                  Navigator.pop(context);
                }),
                // Row(
                //   children: [
                //     typeItem("Published",0,selected,(){
                //       setState(() {
                //         selected=0;
                //       });
                //     }) ,
                //     typeItem("Pendding",1,selected,(){
                //       setState(() {
                //         selected=1;
                //       });
                //     })
                //   ],
                // ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: provider.notificationsList.length == 0
                          ? noPropertyFoundWidget(
                              context, "No notifications found".tr())
                          : selected == 0
                              ? noPropertyFoundWidget(
                                  context, "No notifications found".tr())
                              : ListView.builder(
                                  itemCount: provider.notificationsList.length,
                                  itemBuilder: (context, index) {
                                    String val = "";
                                    List<String> values = [];
                                    String name='';
                                    for(int i=0;i<provider.allUsers.length;i++){
                                      if(provider.allUsers[i].id==provider
                                          .getNotificationsList[index].creatorId){
                                      if(provider.allUsers[i].firstName!=null){
                                        name=provider.allUsers[i].firstName + provider.allUsers[i].lastName;
                                      }else{
                                        name="";
                                      }
                                      }
                                    }
                                    if (provider
                                        .getNotificationsList[index].detail
                                        .contains("liked your property")) {
                                      print("it contabus");
                                      values = provider
                                          .getNotificationsList[index].detail
                                          .split("liked your property");
                                      val =
                                      "${name} ${'liked your property'.tr()}${values[1]}";
                                    } else {
                                      val = provider
                                          .getNotificationsList[index].detail
                                          .tr();
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          bottom: 10,
                                          top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //     builder: (context) => PropertyDetailPage(
                                          //         provider.notificationsList[index],false)));
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
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.black.withOpacity(0.1)),
                                                  child:
                                                  provider
                                                              .getNotificationsList[
                                                                  index]
                                                              .img ==
                                                          null
                                                      ?
                                                  Padding(
                                                        padding: const EdgeInsets.all(12.0),
                                                        child: SvgPicture.asset("Assets/personLiner.svg",color: Colors.black,),
                                                      )
                                                      : ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        1000),
                                                        child: Image.network(provider
                                                            .getNotificationsList[
                                                                index]
                                                            .img),
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: CustomText(
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                    size: 13,
                                                    text:val,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6,
                                                child: CustomText(
                                                  text: Jiffy(DateTime.fromMillisecondsSinceEpoch(
                                                              int.parse(provider
                                                                  .getNotificationsList[
                                                                      index]
                                                                  .timeStamp))
                                                          .toLocal())
                                                      .fromNow(),
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  size: 8,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
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
                  ? Constant.darkblue
                  : Colors.black.withOpacity(0.3),
              size: current == selected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }

  void setImages() {
    var provider = Provider.of<RoleIdentifier>(context, listen: false);
    for (int i = 0; i < provider.getNotificationsList.length; i++) {
      for (int j = 0; j < provider.getAllUsers.length; j++) {
        if (provider.getAllUsers[j].id ==
            provider.getNotificationsList[i].creatorId) {
          provider.getNotificationsList[i].img = provider.getAllUsers[j].imgurl;
        }
      }
    }
  }
}
