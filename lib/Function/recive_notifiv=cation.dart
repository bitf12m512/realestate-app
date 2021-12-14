import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:realestate/Provider/provider_class.dart';
class PushNotificationService {
  final BuildContext context;

  PushNotificationService(this.context);
  initFirebaseMessaging() {

    try {
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage message) {
          return;
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        return;
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("message");
        print(message);
        if (message == null) {
          return;
        }
          _showInAppScreenNotification(message);
      });
    } catch (e, stackTrack) {
      print('_MyAppState.initState: e: $e: stackTrack: $stackTrack');
    }
  }

  void _showInAppScreenNotification(RemoteMessage notification) {
    // var provider=Provider.of<RoleIdentifier>(context,listen: false);
    // String name='';
    // for(int i=0;i<provider.allUsers.length;i++){
    //   if(provider.allUsers[i].deviceTokens.contains(element))
    // }
    String val="";
    List<String> values=[];
    if(notification.notification.body.contains("liked your property")){
      values= notification.notification.body.split("liked your property");
      val="${values[0]}${'liked your property'.tr()}${values[1]}";
    }else{
      val=notification.notification.body.tr();
    }
    InAppNotification.show(
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        height: 80.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
             text: '${notification.notification.title}',
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w500,
              size: 18,
              // style: bodyText1,
              // maxLines: 1,
            ),
            CustomText(
              text: '${val}',
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w400,
              size: 14,
            ),
          ],
        ),
      ),
      context: context,
      onTap: () {
        // if (notification == null) return;
        // _goto(notification);
      },
    );
  }
}