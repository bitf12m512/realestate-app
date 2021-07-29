import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Provider/provider_class.dart';

readData(BuildContext context){
  FirebaseDatabase.instance.reference().child("Properties").onValue.listen((event) {
          if(event.snapshot.value!=null){
            List keys=event.snapshot.value.keys.toList();
            for(int i=0;i<keys.length;i++){
              Property p=Property.fromMap(event.snapshot.value[keys[i]]);
              Provider.of<RoleIdentifier>(context,listen: false).addTOProprertyList(p);
              print("one property added at a time");
            }
          }
  });
  FirebaseDatabase.instance.reference().child("Users").child(Provider.of<RoleIdentifier>(context,listen: false).appuser.id
  ).child("favourites").onValue.listen((event) {
          if(event.snapshot.value!=null){
            // List keys=event.snapshot.value.keys.toList();
            // for(int i=0;i<keys.length;i++){

            List fav=  List<String>.from(event.snapshot.value);
            Provider.of<RoleIdentifier>(context,listen: false).setFavouriteIdies(fav);

            // }
          }
  });

}