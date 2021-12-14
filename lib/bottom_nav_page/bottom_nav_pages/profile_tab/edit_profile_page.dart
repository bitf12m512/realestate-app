import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/app_user.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';
import 'package:realestate/Function/get_image_from_gallery.dart';
import 'package:realestate/Function/service.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/Widgets/alert_dialog.dart';
import 'package:realestate/Widgets/rounded_app_bar.dart';
import 'package:realestate/Widgets/select_image_option.dart';
import 'package:realestate/Widgets/send_button.dart';
import 'package:toast/toast.dart';

import '../../../Classes/custom_text.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/text_field.dart';
import '../../../Widgets/text_field_without_prefix.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int selected = 0;
  String prefixText="";
  String imgurl="";
  File image;
  bool editable=false;
  CountryCode countryCode=new CountryCode(dialCode: "+92",code: "PK",name: "Pakistan",flagUri: "flags/pk.png");
  BoxDecoration deco = BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
      border: Border.all(color: Colors.black.withOpacity(0.3)));
  TextEditingController phone = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController address1 = new TextEditingController();
  TextEditingController address2 = new TextEditingController();
   GlobalKey<FormState> _globalKey=new GlobalKey<FormState>();

  @override
  void initState() {

    // TODO: implement initState
    setData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              roundedAppBarwithBackedit(context, editable==true?"Profile Edit".tr():"Profile".tr(),(){
                setState(() {
                  editable=true;
                });
              },editable==false?Colors.white.withOpacity(0.6):Colors.transparent),
              Expanded(
                child: Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 140,
                            width: 140,
                            // color: Colors.green,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: deco,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: deco,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              color: Constant.blueColor
                                                  .withOpacity(0.8)),
                                          child:
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(100),
                                            child: image != null
                                                ? Image.file(
                                              image,
                                              fit: BoxFit.fill,
                                            )
                                                :
                                            imgurl != null && imgurl!=""
                                                ? Image.network(imgurl)
                                                :   Padding(
                                              padding: const EdgeInsets.only(top: 12.0),
                                              child: SvgPicture.asset("Assets/pip.svg"),
                                            ),
                                          )

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                editable==true?Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      if (editable == true) {
                                        imageSelectionOption(context,
                                                () async {
                                              Navigator.of(context).pop();
                                              File f = await GetImage(context);
                                              image = await CropImage(
                                                  context, f);
                                              setState(() {});
                                            }, () async {
                                              Navigator.of(context).pop();
                                              File f =
                                              await GetImageFromGallery(context);
                                              image = await CropImage(
                                                  context, f);
                                              setState(() {});
                                            });
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border:
                                              Border.all(color: Colors.white, width: 3),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            stops: [0.1, 0.9],
                                            colors: [
                                              Color(0xffEB319D),
                                              Constant.blueColor,
                                            ],
                                          ),
                                        ),
                                        child:  Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: SvgPicture.asset("Assets/camn.svg"),
                                        ),

                                      ),
                                    ),
                                  ),
                                ):Container()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Personal Information".tr(),
                            color: Colors.black,
                            size: 23,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWithOutPrefix(context,"", "First Name".tr(),
                                    editable, firstName, TextInputType.text, 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFieldWithOutPrefix(context, "","Last Name".tr(),
                                    editable, lastname, TextInputType.text, 14),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldBoxSmall(context, Icons.mail, "emailAddress".tr(), editable, email,
                              TextInputType.emailAddress, 100),
                          SizedBox(
                            height: 15,
                          ),
                          // GestureDetector(
                          //   child: Container(
                          //     // height:MediaQuery.of(context).size.height/18,
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: BoxDecoration(
                          //       color:Colors.white,
                          //       borderRadius: new BorderRadius.circular(2.0),
                          //       border: Border.all(color:Colors.black.withOpacity(0.2)),
                          //     ),
                          //     child: Padding(
                          //         padding: const EdgeInsets.symmetric(horizontal:20.0),
                          //         child: Center(
                          //           child: CountryCodePicker(
                          //             enabled: editable,
                          //             onChanged: (val){
                          //               // print()
                          //               setState(() {
                          //                 prefixText=val.code;
                          //               });
                          //             },
                          //             // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          //             initialSelection: 'IT',
                          //             favorite: ['+39','FR'],
                          //             // optional. Shows only country name and flag
                          //             showCountryOnly: true,
                          //             // optional. Shows only country name and flag when popup is closed.
                          //             showOnlyCountryWhenClosed: true,
                          //             // optional. aligns the flag and the Text left
                          //             alignLeft: true,
                          //           ),
                          //         )
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          TextFieldWithOutPrefix(context,"" ,"phoneNumber".tr(),
                              false, phone, TextInputType.phone, 14),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldWithOutPrefix(context,"", "Address 1".tr(),
                              editable, address1, TextInputType.text, 14),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldWithOutPrefix(context,"", "Address 2".tr(),
                              editable, address2, TextInputType.text, 14),     SizedBox(
                            height: 15,
                          ),
                         editable==true? saveButton(context,"Save".tr(),(){
                            if(_globalKey.currentState.validate()){
                              updateProfile();
                            }
                          }):Container()
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  setData(){
   AppUser appUser=Provider.of<RoleIdentifier>(context,listen: false).appuser;
    setState(() {
     firstName.text=appUser.firstName;
     lastname.text=appUser.lastName;
     email.text=appUser.email;
     phone.text=appUser.phoneNumber;
     address1.text=appUser.firstAddress;
     address2.text=appUser.secondAddress;
     imgurl=appUser.imgurl;
   });

  }
  Future<void>  updateProfile() async {

    showAlertDialog(context, "pleasewait".tr());
    AppUser appu=new AppUser();
    try{
      if(image!=null){
        appu.imgurl=await uploadimage(image);
      }else{
        appu.imgurl=imgurl;
      }
      appu.email = email.text;
      appu.id =Provider.of<RoleIdentifier>(context,listen: false).appuser.id;
      appu.firstName=firstName.text;
      appu.lastName=lastname.text;
      appu.firstAddress=address1.text;
      appu.secondAddress=address2.text;
      appu.country=null;

      appu.phoneNumber=phone.text;
      appu.email=email.text;
      await FirebaseDatabase.instance
          .reference()
          .child("Users")
          .child(appu.id)
          .update(appu.toMap());
      // await FirebaseDatabase.instance
      //     .reference()
      //     .child("Users")
      //     .child(appu.id).update({"countryCode": countryCode});
      Provider.of<RoleIdentifier>(context,listen: false).setAppuser(appu);
      setData();
      Navigator.of(context).pop();
      setState(() {
        editable = false;
      });
      Toast.show(
          'Profile Updated.'.tr(), context,
          duration: 4, gravity: Toast.TOP);
    }
    catch(e)
    {
      Navigator.of(context).pop();
      print(e.toString());
      Toast.show(
          'errorOccurred'.tr(), context,
          duration: 4, gravity: Toast.TOP);
    }

  }
}
