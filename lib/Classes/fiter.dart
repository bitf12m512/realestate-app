import 'package:flutter/material.dart';
class Filter{
  String availableFor,mainCategory,priceStart,priceEnd,areaStart,areaEnd,governorate,district;
  int bedrooms,bathRooms,parkingSpots,masterRooms;
  bool maidRoom,swimmingPool,centralAC,elevator;

  Filter(
      {this.availableFor,
      this.mainCategory,
      this.priceStart,
      this.priceEnd,
      this.areaStart,
      this.areaEnd,
      this.governorate,
      this.district,
      this.bedrooms,
      this.bathRooms,
      this.parkingSpots,
      this.masterRooms,
      this.maidRoom,
      this.swimmingPool,
      this.centralAC,
      this.elevator});
}