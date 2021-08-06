import 'package:flutter/material.dart';
class Filter{
  String availableFor,mainCategory,subCategory,priceStart,priceEnd,areaStart,areaEnd;
  int bedrooms,bathRooms,parkingSpots,masterRooms;
  bool maidRoom,swimmingPool,centralAC,elevator;

  Filter(
      {this.availableFor,
      this.mainCategory,
      this.subCategory,
      this.priceStart,
      this.priceEnd,
      this.areaStart,
      this.areaEnd,
      this.bedrooms,
      this.bathRooms,
      this.parkingSpots,
      this.maidRoom,
      this.swimmingPool,
      this.masterRooms,
      this.centralAC,
      this.elevator});
}