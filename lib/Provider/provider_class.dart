import 'package:flutter/material.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/property.dart';
class RoleIdentifier extends ChangeNotifier{
  AppUser appuser=new AppUser();
  List favouriteIdies=[];
  List myProductsIdies=[];
  List<Property> properties=[];
  List<Property> propertiesBack=[];
  List<Property> myProperties=[];
  AppUser get getAppUser=>appuser;
  List get getFavouriteIdies=>favouriteIdies;
  List get getMyProductsidies=>myProductsIdies;

  List<Property> get getPropertyList=>properties;
  List<Property> get getMyPropertyList=>myProperties;
  List<Property> get getPropertyBackList=>propertiesBack;
  void setPropertyList(List<Property> oppla){
    properties=oppla;
    notifyListeners();
  }
  void setMyPropertyList(List<Property> oppla){
    myProperties=oppla;
    notifyListeners();
  }
  void setPropertyBackList(List<Property> oppla){
    propertiesBack=oppla;
    notifyListeners();
  }
  void setFavouriteIdies(List oppla){
    favouriteIdies=oppla;
    notifyListeners();
  }
  void setMyProductsIdies(List oppla){
    myProductsIdies=oppla;
    notifyListeners();
  }
  void addTOFavouriteIdies(String oppla){
    favouriteIdies.add(oppla);
    notifyListeners();
  }
  void addToMyProductsIdies(String oppla){
    myProductsIdies.add(oppla);
    notifyListeners();
  }
  void addTOProprertyList(Property oppla){
    properties.add(oppla);
    notifyListeners();
  }
  void addToMyProprertyList(Property oppla){
    myProperties.add(oppla);
    notifyListeners();
  }
  void addTOProprertyBackList(Property oppla){
    propertiesBack.add(oppla);
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