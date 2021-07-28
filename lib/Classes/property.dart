import 'package:flutter/material.dart';

class Property {
  String name,
      price,
      position,
      description,
      id,
      timeStamp,
      availableFor,
      mainType,
      governorate,
      district,addType;
  int bedRooms, masterBed, livingRoom, bathRooms, floors, parkingSpots;
  bool maiRoom, swimmingPool, centralAc, elevator;
  List<imgItem> images;
  Property(
      {this.name,
      this.price,
      this.position,
      this.description,
      this.id,
      this.timeStamp,
      this.availableFor,
      this.mainType,
      this.governorate,
      this.district,
      this.addType,
      this.bedRooms,
      this.masterBed,
      this.livingRoom,
      this.bathRooms,
      this.floors,
      this.parkingSpots,
      this.maiRoom,
      this.swimmingPool,
      this.centralAc,
      this.images,
      this.elevator});

  factory Property.fromMap(Map map) {
    return new Property(
      name: map['name'] as String,
      price: map['price'] as String,
      position: map['position'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      timeStamp: map['timeStamp'] as String,
      availableFor: map['availableFor'] as String,
      mainType: map['mainType'] as String,
      governorate: map['governorate'] as String,
      district: map['district'] as String,
      addType: map['addType'] as String,
      bedRooms: map['bedRooms'] as int,
      masterBed: map['masterBed'] as int,
      livingRoom: map['livingRoom'] as int,
      bathRooms: map['bathRooms'] as int,
      images: map['images'] as List<imgItem>,
      floors: map['floors'] as int,
      parkingSpots: map['parkingSpots'] as int,
      maiRoom: map['maiRoom'] as bool,
      swimmingPool: map['swimmingPool'] as bool,
      centralAc: map['centralAc'] as bool,
      elevator: map['elevator'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'price': this.price,
      'position': this.position,
      'description': this.description,
      'id': this.id,
      'timeStamp': this.timeStamp,
      'availableFor': this.availableFor,
      'mainType': this.mainType,
      'governorate': this.governorate,
      'district': this.district,
      'addType': this.addType,
      'bedRooms': this.bedRooms,
      'masterBed': this.masterBed,
      'livingRoom': this.livingRoom,
      'bathRooms': this.bathRooms,
      'images': this.images,
      'floors': this.floors,
      'parkingSpots': this.parkingSpots,
      'maiRoom': this.maiRoom,
      'swimmingPool': this.swimmingPool,
      'centralAc': this.centralAc,
      'elevator': this.elevator,
    } as Map<String, dynamic>;
  }
}
class imgItem{
  String img,id;
  imgItem({this.img, this.id});
}
