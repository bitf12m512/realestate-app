import 'package:flutter/material.dart';
class ContactUs{
  String id,name,phoneNumber,description,timeStamp,contacterId;

  ContactUs(
      {this.id,
      this.name,
      this.phoneNumber,
      this.description,
      this.timeStamp,
      this.contacterId});

  factory ContactUs.fromMap(Map map) {
    return new ContactUs(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      description: map['description'] as String,
      timeStamp: map['timeStamp'] as String,
      contacterId: map['contacterId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'phoneNumber': this.phoneNumber,
      'description': this.description,
      'timeStamp': this.timeStamp,
      'contacterId': this.contacterId,
    } as Map<String, dynamic>;
  }
}