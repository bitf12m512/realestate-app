import 'package:flutter/material.dart';

class Property {
  String name,
      price,
      position,
      description,
      id,
  creatorId,
      timeStamp,
      availableFor,
      mainType,
      governorate,
      district,addType;
  int bedRooms, masterBed, livingRoom, bathRooms, floors, parkingSpots,packageIndex;
  bool maiRoom, swimmingPool, centralAc, elevator;
  List images;
  Property(
      {this.name,
      this.price,
      this.position,
      this.description,
      this.id,
        this.images,
      this.creatorId,
      this.timeStamp,
      this.availableFor,
      this.packageIndex,
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
      this.elevator});

  factory Property.fromMap(Map map) {
    return new Property(
      name: map['name'] as String,
      price: map['price'] as String,
      position: map['position'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      creatorId: map['creatorId'] as String,
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
      packageIndex: map['packageIndex'] as int,
      images:  map['images'] == null ? [] : List<String>.from(map['images']),
      // map['images'] == null
      // ? []
      //   // : map['comments'] as List<Comment>
      //       : imgItem.toCommentList(data: map['images']),
      // map['images'] as List<imgItem>,
    //     likes: map['likes'] == null ? [] : List<String>.from(map['likes']),
    // comments: map['comments'] == null
    // ? []
    // // : map['comments'] as List<Comment>
    //     : Comment.toCommentList(data: map['comments']),
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
      'creatorId': this.creatorId,
      'timeStamp': this.timeStamp,
      'availableFor': this.availableFor,
      'mainType': this.mainType,
      'packageIndex': this.packageIndex,
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

  factory imgItem.fromMap(Map map) {
    return new imgItem(
      img: map['img'] as String,
      id: map['id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'img': this.img,
      'id': this.id,
    } as Map<String, dynamic>;
  }
  static List<imgItem> toCommentList({
    @required var data,
  }) {
    Map values = data as Map;
    List<imgItem> comments = [];
    values.forEach((key, data) {
      final imgItem comment = imgItem.fromMap(data);
      comments.add(comment);
    });
    return comments;
  }
}