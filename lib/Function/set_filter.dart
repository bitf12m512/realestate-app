import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Classes/fiter.dart';
import 'package:realestate/Provider/provider_class.dart';

Future<void> setFilter(Filter filter, BuildContext context) async {
  var provider = Provider.of<RoleIdentifier>(context, listen: false);
  provider.setPropertyList([]);
  for (int i = 0; i < provider.getPropertyBackList.length; i++) {
    bool match = false;
    print(provider.getPropertyBackList[i].availableFor.toLowerCase());
    print(filter.availableFor);

    if (provider.getPropertyBackList[i].availableFor.toLowerCase() ==
            filter.availableFor.toLowerCase() ||
        filter.availableFor.toLowerCase() == "all") {
      print(filter.availableFor);
      print(provider.getPropertyBackList[i].availableFor);
      if (provider.getPropertyBackList[i].mainType.toLowerCase() ==
          filter.mainCategory.toLowerCase()) {
        match = subfilter(filter, i, true, context);
      } else if (filter.mainCategory.toLowerCase() == "all") {
        match = subfilter(filter, i, true, context);
      }
    } else if (filter.availableFor.toLowerCase() == "buy" &&
        provider.getPropertyBackList[i].availableFor.toLowerCase() == "sale") {
      print("got this property");
      match = subfilter(filter, i, true, context);
    }
    if (match == true) {
      provider.addTOProprertyList(provider.getPropertyBackList[i]);
    }
  }
}

bool subfilter(Filter filter, int i, bool maching, BuildContext context) {
  var provider = Provider.of<RoleIdentifier>(context, listen: false);
  bool match = maching;

  if (match == true && filter.governorate != "") {
    if (provider.getPropertyBackList[i].governorate == filter.governorate ||
        filter.governorate == "All") {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.position != "") {
    if (filter.position.toLowerCase() ==
        provider.getPropertyBackList[i].position.toLowerCase()) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true &&
      filter.governorate != "All" &&
      filter.governorate != "") {
    if (filter.district != "") {
      if (provider.getPropertyBackList[i].district == filter.district ||
          filter.district == "All") {
        match = true;
      } else {
        match = false;
      }
    }
  }
  if (match == true && filter.priceEnd != "" && filter.priceEnd != null) {
    if (double.parse(provider.getPropertyBackList[i].price) <
            double.parse(filter.priceEnd) &&
        double.parse(provider.getPropertyBackList[i].price) >
            double.parse(filter.priceStart)) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.areaEnd != "" && filter.areaEnd != null) {
    if (double.parse(provider.getPropertyBackList[i].area) <
            double.parse(filter.areaEnd.toString()) &&
        double.parse(provider.getPropertyBackList[i].area) >
            double.parse(filter.areaStart.toString())) {
      print(provider.getPropertyBackList[i].area);
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.bedrooms != 0) {
    if (filter.bedrooms == provider.getPropertyBackList[i].bedRooms) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.masterRooms != 0) {
    if (filter.masterRooms == provider.getPropertyBackList[i].masterBed) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.bathRooms != 0) {
    if (filter.bathRooms == provider.getPropertyBackList[i].bathRooms) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.parkingSpots != 0) {
    if (filter.parkingSpots == provider.getPropertyBackList[i].parkingSpots) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.maidRoom == true) {
    if (filter.maidRoom == provider.getPropertyBackList[i].maiRoom) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.swimmingPool == true) {
    if (filter.swimmingPool == provider.getPropertyBackList[i].swimmingPool) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.centralAC == true) {
    if (filter.centralAC == provider.getPropertyBackList[i].centralAc) {
      match = true;
    } else {
      match = false;
    }
  }
  if (match == true && filter.elevator == true) {
    if (filter.elevator == provider.getPropertyBackList[i].elevator) {
      match = true;
    } else {
      match = false;
    }
  }
  return match;
}
