import 'package:flutter/material.dart';
import 'package:realestate/Classes/app_user.dart';
class RoleIdentifier extends ChangeNotifier{
  AppUser appuser=new AppUser();
  AppUser get getAppUser=>appuser;
   void setAppuser(AppUser oppla){
     appuser=oppla;
     notifyListeners();
   }
   void setAppuserEmpty(){
     appuser=new AppUser();
     notifyListeners();
   }
}