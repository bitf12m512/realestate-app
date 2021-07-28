import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:realestate/auth/sign_in.dart';
import 'package:realestate/bottom_nav_page/bottom_navigation_bar_page.dart';

import 'Classes/app_user.dart';
import 'Constants/constants.dart';
import 'Provider/provider_class.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Constant.appColor,
          child:Image.asset("Assets/logotext-excluded.png",fit:BoxFit.fill,),
        ),
        SafeArea(
          child: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.height / 18,
                
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.deepOrange
                      ),
                      child: Image.asset("Assets/realestateL@3x.png",
                      height: 20,
                      )),
                ),
                Container(

                )
              ],
            )),
          ),
        )
      ],
    ));
  }

  navigate() async {
    // readData(context);
    User user =  FirebaseAuth.instance.currentUser;
    if(user==null){

      Future.delayed(Duration(seconds: 2)).then((val) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => SignInPage()));
      });
    }
    else{
      await FirebaseDatabase.instance
          .reference()
          .child("Users")
          .child(user.uid)
          .once()
          .then((DataSnapshot dataSnapshot) {
        if (dataSnapshot.value != null) {
          AppUser appUser = new AppUser();
          appUser = AppUser.fromMap(dataSnapshot.value);
          Provider.of<RoleIdentifier>(context, listen: false).setAppuser(appUser);
        }
        // Navigator.of(context).pop();
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (_) => BottomNavigationBarPage(0)));
      });
      Future.delayed(Duration(seconds: 2)).then((val) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => BottomNavPage()));
      });
    }
    // List cat=["Shoes","Bags","Cosmetics","Saloon","Food","Clothes","Kitchen tools","Grocery","Speakers"];
    // for(int i=0;i<cat.length;i++){
    //   CategoryItem c=new CategoryItem();
    //   c.name=cat[i];
    //   c.id=FirebaseDatabase.instance.reference().child("Categories").push().key;
    //   FirebaseDatabase.instance.reference().child("Categories").child(c.id).set(c.toMap());
    // }
    // readData(context);
    // User user =  FirebaseAuth.instance.currentUser;
    // if(user==null){
    //
    //   Future.delayed(Duration(seconds: 2)).then((val) {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (_) => SignInPage()));
    //   });
      // Future.delayed(Duration(seconds: 2)).then((val) {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (_) => BottomNavPage()));
      // });
    // }
    // else{
    //   await FirebaseDatabase.instance
    //       .reference()
    //       .child("Users")
    //       .child(user.uid)
    //       .once()
    //       .then((DataSnapshot dataSnapshot) {
    //     if (dataSnapshot.value != null) {
    //       AppUser appUser = new AppUser();
    //       appUser = AppUser.fromMap(dataSnapshot.value);
    //       Provider.of<RoleIdentifier>(context, listen: false).setAppuser(appUser);
    //     }
    //     // Navigator.of(context).pop();
    //     // Navigator.of(context).pushReplacement(
    //     //     MaterialPageRoute(builder: (_) => BottomNavigationBarPage(0)));
    //   });
    //   Future.delayed(Duration(seconds: 2)).then((val) {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (_) => BottomNavigationBarPage(0)));
    //   });
    // }


  }
}
