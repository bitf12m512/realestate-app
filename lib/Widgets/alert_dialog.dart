import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
showAlertDialog(BuildContext context, String str) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(str),
          content: Container(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 10,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      });
}
showMessageDialog(BuildContext context, String str,Function ontap2) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(str),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel".tr(),style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18
              ),),
            ),
            TextButton(
              onPressed: ontap2,
              child: Text("Create Account".tr(),style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18
              ),),
            ),
          ],
        );
      });
}
showConfirmationDialog(BuildContext context, String str,Function ontap2) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(str),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("no".tr(),style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18
              ),),
            ),
            TextButton(
              onPressed: ontap2,
              child: Text("yes".tr(),style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18
              ),),
            ),
          ],
          // content: Container(
          //   height: MediaQuery.of(context).size.height / 15,
          //   width: MediaQuery.of(context).size.width / 10,
          //   child: Center(child: CircularProgressIndicator()),
          // ),
        );
      });
}