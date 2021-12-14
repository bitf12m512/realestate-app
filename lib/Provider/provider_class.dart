import 'package:flutter/material.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/notification.dart';
import 'package:realestate/Classes/package.dart';
import 'package:realestate/Classes/property.dart';
class RoleIdentifier extends ChangeNotifier{
  String englishT="",arabicT="";
  AppUser appuser=new AppUser();
  List<Package> packages;
  List favouriteIdies=[];
  List myProductsIdies=[];
  List<Property> properties=[];
  List<Property> propertiesBack;
  List<String> deviceIdies=[];
  List<Property> myProperties=[];
  List<NotificationA> notificationsList=[];
  List<AppUser> allUsers=[];
  List<AppUser> get getAllUsers=>allUsers;
  AppUser get getAppUser=>appuser;
  List get getFavouriteIdies=>favouriteIdies;
  List get getMyProductsidies=>myProductsIdies;
  List<Property> get getPropertyList=>properties;
  List<Package> get getPackagesList=>packages;
  List<NotificationA> get getNotificationsList=>notificationsList;
  List<String> get getDeviceIdies=>deviceIdies;
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
  void setPackagesList(List<Package> oppla){
    packages=oppla;
    notifyListeners();
  }
  void setTermsAndConditions(String oppla1,String oppla2){
    englishT=oppla1;
    arabicT=oppla2;
    notifyListeners();
  }
  void setAllUsers(List<AppUser> oppla){
    allUsers.clear();
    allUsers=oppla;
    notifyListeners();
  }
  void setPropertyBackList(List<Property> oppla){

    propertiesBack=[];
    propertiesBack=oppla;
    notifyListeners();
  }
  void setFavouriteIdies(List oppla){
    favouriteIdies=oppla;
    notifyListeners();
  }
  void setDeviceIdies(List<String> oppla){
    deviceIdies.clear();
    deviceIdies=oppla;
    notifyListeners();
  }
  void setNotificationsLIst(List<NotificationA> oppla){
    notificationsList.clear();
    notificationsList=oppla;
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