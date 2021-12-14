import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/notification.dart';
import 'package:realestate/Provider/provider_class.dart';
sendNotification(BuildContext context,String title,String m,List<String> recivers) async {
  var provider=Provider.of<RoleIdentifier>(context,listen: false);
  List<String> idies=[];
  recivers.remove(provider.appuser.id);
  for(int i=0;i<provider.allUsers.length;i++){
    if(recivers.contains(provider.allUsers[i].id)){
      // print()
       idies.addAll(provider.allUsers[i].deviceTokens);
    }
  }
if(recivers!=null || recivers.length!=0){
  var message =  FirebaseFunctions.instance.httpsCallable("sendNotification");
  var response =await  message({
    'title': title,
    'message':m,
    'deviceToken': idies,
  });
  for(int i=0;i<recivers.length;i++){
    String id=FirebaseDatabase.instance.reference().child("Notifications").push().key;
    String timeStamp=DateTime.now().toLocal().millisecondsSinceEpoch.toString();
    NotificationA notificationA=new NotificationA(
        timeStamp: timeStamp,
        title: title,
        detail: m,
        reciverid:recivers[i],
        id: id,
        creatorId: provider.appuser.id
    );
    await  FirebaseDatabase.instance.reference().child("Notifications").child(id).set(notificationA.toMap());
  }
}
}

