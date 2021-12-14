import 'package:flutter/material.dart';
class Filter{
  String availableFor,mainCategory,
      priceStart,priceEnd,areaStart,areaEnd,governorate,district,position;

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
      this.position,
      this.centralAC,
      this.elevator});
}