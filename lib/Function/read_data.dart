import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/notification.dart';
import 'package:realestate/Classes/package.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Function/device_id_getteer.dart';
import 'package:realestate/Provider/provider_class.dart';

readData(BuildContext context) async {
  var provider = Provider.of<RoleIdentifier>(context, listen: false);
  FirebaseDatabase.instance
      .reference()
      .child("Notifications")
      .orderByChild("reciverid")
      .equalTo(provider.appuser.id)
      .onValue
      .listen((event) {
    if (event.snapshot.value != null) {
      List<NotificationA> noti = [];
      List keys = event.snapshot.value.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        NotificationA notificationA = new NotificationA();
        notificationA = NotificationA.fromMap(event.snapshot.value[keys[i]]);
        noti.add(notificationA);
      }
      // someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));
      noti.sort((b, a) => a.timeStamp.compareTo(b.timeStamp));
      Provider.of<RoleIdentifier>(context, listen: false)
          .setNotificationsLIst(noti);
    } else {
      Provider.of<RoleIdentifier>(context, listen: false)
          .setNotificationsLIst([]);
    }
  });
  await FirebaseDatabase.instance
      .reference()
      .child("TermsAndConditions")
      .once()
      .then((value) {
    if (value.value != null) {
      print(value.value);
      Map m = value.value;
      print(m);
      provider.setTermsAndConditions(
          m["english"], m["arabic"]);

    }
  });
  await FirebaseDatabase.instance
      .reference()
      .child("Packages")
      .once()
      .then((value) {
    if (value.value != null) {
     List<Package> pppp = [];
      for (int i = 0; i < value.value.length; i++) {
        Package p = new Package();
        p = Package.fromMap(value.value[i]);
        pppp.add(p);
      }
      provider.packages = pppp;
    } else {
      provider.packages = [];
    }
  });
  await FirebaseDatabase.instance
      .reference()
      .child("Users")
      .once()
      .then((DataSnapshot dataSnapshot) {
    if (dataSnapshot.value != null) {
      List<AppUser> appUSers = [];
      List keys = dataSnapshot.value.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        AppUser appUser = new AppUser();
        appUser = AppUser.fromMap(dataSnapshot.value[keys[i]]);
        appUSers.add(appUser);
      }
      // appUSers=Li/st<AppUser>.from(dataSnapshot.value.toList());
      //
      Provider.of<RoleIdentifier>(context, listen: false).setAllUsers(appUSers);
    } else {
      Provider.of<RoleIdentifier>(context, listen: false).setAllUsers([]);
    }
  });
  await FirebaseDatabase.instance
      .reference()
      .child("Users")
      .child(Provider.of<RoleIdentifier>(context, listen: false).appuser.id)
      .once()
      .then((DataSnapshot dataSnapshot) {
    if (dataSnapshot.value != null) {
      AppUser appUser = new AppUser();
      appUser = AppUser.fromMap(dataSnapshot.value);
      Provider.of<RoleIdentifier>(context, listen: false).setAppuser(appUser);
    }
  });
  List<String> idies = [];
  // var provider= Provider.of<RoleIdentifier>(context, listen: false);
  String s = await getid();
  FirebaseDatabase.instance
      .reference()
      .child("Users")
      .child(Provider.of<RoleIdentifier>(context, listen: false).appuser.id)
      .child("deviceTokens")
      .once()
      .then((value) async {
    if (value.value != null) {
      idies = List<String>.from(value.value);
      if (idies.contains(s)) {
      } else {
        idies.add(s);
        provider.setDeviceIdies(idies);
      }
    } else {
      idies.add(s);
      provider.setDeviceIdies(idies);
      await FirebaseDatabase.instance
          .reference()
          .child("Users")
          .child(Provider.of<RoleIdentifier>(context, listen: false).appuser.id)
          .child("deviceTokens")
          .set(idies);
    }
  });
  FirebaseDatabase.instance
      .reference()
      .child("Properties")
      .onValue
      .listen((event) {
    if (event.snapshot.value != null) {
      List<Property> properties = [];
      Provider.of<RoleIdentifier>(context, listen: false).setPropertyList([]);
      Provider.of<RoleIdentifier>(context, listen: false)
          .setPropertyBackList([]);
      Provider.of<RoleIdentifier>(context, listen: false).setMyPropertyList([]);
      Provider.of<RoleIdentifier>(context, listen: false)
          .setMyProductsIdies([]);
      List keys = event.snapshot.value.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Property p = Property.fromMap(event.snapshot.value[keys[i]]);
        if (p.premiumTill == null) {
          p.premiumTill = p.timeStamp;
        }
        if (p.status == null) {
          p.status = "Pending";
        }
        if (p.images.length == 0 || p.images.isEmpty) {
        } else {
          properties.add(p);
        }
      }
      properties.sort((b, a) => a.premiumTill.compareTo(b.premiumTill));
      for (int i = 0; i < properties.length; i++) {
        if (properties[i].creatorId ==
            Provider.of<RoleIdentifier>(context, listen: false).appuser.id) {
          Provider.of<RoleIdentifier>(context, listen: false)
              .addToMyProprertyList(properties[i]);
          Provider.of<RoleIdentifier>(context, listen: false)
              .addToMyProductsIdies(properties[i].id);
        }
        Provider.of<RoleIdentifier>(context, listen: false)
            .addTOProprertyList(properties[i]);
        Provider.of<RoleIdentifier>(context, listen: false)
            .addTOProprertyBackList(properties[i]);
      }
    } else {
      Provider.of<RoleIdentifier>(context, listen: false).setPropertyList([]);
      Provider.of<RoleIdentifier>(context, listen: false)
          .setPropertyBackList([]);
    }
  });
  FirebaseDatabase.instance
      .reference()
      .child("Users")
      .child(Provider.of<RoleIdentifier>(context, listen: false).appuser.id)
      .child("favourites")
      .onValue
      .listen((event) {
    if (event.snapshot.value != null) {
      List fav = List<String>.from(event.snapshot.value);
      Provider.of<RoleIdentifier>(context, listen: false)
          .setFavouriteIdies(fav);
    } else {
      Provider.of<RoleIdentifier>(context, listen: false).setFavouriteIdies([]);
    }
  });
}
