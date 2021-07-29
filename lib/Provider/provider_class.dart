import 'package:flutter/material.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/property.dart';
class RoleIdentifier extends ChangeNotifier{
  AppUser appuser=new AppUser();
  List favouriteIdies=[];
  List<Property> properties=[];
  AppUser get getAppUser=>appuser;
  List get getFavouriteIdies=>favouriteIdies;

  List<Property> get getPropertyList=>properties;
  void setPropertyList(List<Property> oppla){
    properties=oppla;
    notifyListeners();
  }
  void setFavouriteIdies(List oppla){
    favouriteIdies=oppla;
    notifyListeners();
  }
  void addTOProprertyList(Property oppla){
    properties.add(oppla);
    notifyListeners();
  }
  void addTOFavouriteIdies(String oppla){
    favouriteIdies.add(oppla);
    notifyListeners();
  }
   void setAppuser(AppUser oppla){
     appuser=oppla;
     notifyListeners();
   }
   void setAppuserEmpty(){
     appuser=new AppUser();
     notifyListeners();
   }
}