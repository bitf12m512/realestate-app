
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Function/sendNotification.dart';
import 'package:realestate/Provider/provider_class.dart';

Future<void> SendLikeNotification(BuildContext context,List bidders,String productName){
  var provider=Provider.of<RoleIdentifier>(context,listen: false);
  List<String> idies = bidders.cast<String>();
 sendNotification(context,productName,"${provider.appuser.firstName} liked your property ${productName}", idies);
}