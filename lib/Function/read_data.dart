import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/property.dart';
import 'package:realestate/Provider/provider_class.dart';

readData(BuildContext context){
  FirebaseDatabase.instance.reference().child("Properties").onValue.listen((event) {
          if(event.snapshot.value!=null){
            Provider.of<RoleIdentifier>(context,listen: false).properties.clear();
            Provider.of<RoleIdentifier>(context,listen: false).getPropertyBackList.clear();
            Provider.of<RoleIdentifier>(context,listen: false).getMyPropertyList.clear();
            List keys=event.snapshot.value.keys.toList();
            for(int i=0;i<keys.length;i++){
              Property p=Property.fromMap(event.snapshot.value[keys[i]]);
              Property pp=Property.fromMap(event.snapshot.value[keys[i]]);
              Property ppp=Property.fromMap(event.snapshot.value[keys[i]]);
              if(p.status==null){
                p.status="Pending";
                pp.status="Pending";
                ppp.status="Pending";
              }
             if(p.images.length==0||p.images.isEmpty){

             }
             else{
               if(ppp.creatorId==Provider.of<RoleIdentifier>(context,listen: false).appuser.id
               ){
                 Provider.of<RoleIdentifier>(context,listen: false).addToMyProprertyList(ppp);
                 Provider.of<RoleIdentifier>(context,listen: false).addToMyProductsIdies(ppp.id);
               }
               Provider.of<RoleIdentifier>(context,listen: false).addTOProprertyList(p);
               Provider.of<RoleIdentifier>(context,listen: false).addTOProprertyBackList(pp);
             }
            }
          }
          else{
            Provider.of<RoleIdentifier>(context,listen: false).setPropertyList([]);
            Provider.of<RoleIdentifier>(context,listen: false).setPropertyBackList([]);
          }
  });
  FirebaseDatabase.instance.reference().child("Users").child(Provider.of<RoleIdentifier>(context,listen: false).appuser.id
  ).child("favourites").onValue.listen((event) {
          if(event.snapshot.value!=null){
            List fav=  List<String>.from(event.snapshot.value);
            Provider.of<RoleIdentifier>(context,listen: false).setFavouriteIdies(fav);
          }
          else{
            Provider.of<RoleIdentifier>(context,listen: false).setFavouriteIdies([]);
          }
  });

}