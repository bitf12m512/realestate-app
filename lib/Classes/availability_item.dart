import 'package:realestate/Classes/property.dart';

class AvailabilityItem{
  String timeStamp,availabilityItemID,notes,name,phoneNumber,userID,moveInTimeStamp;
  Property property=new Property();
bool furnitureMovingService;
  AvailabilityItem(
      {this.timeStamp,
      this.availabilityItemID,
      this.name,
      this.notes,
      this.phoneNumber,
      this.moveInTimeStamp,
      this.furnitureMovingService,
      this.userID,
      this.property});

  factory AvailabilityItem.fromMap(Map map) {
    return new AvailabilityItem(
      timeStamp: map['timeStamp'] as String,
      availabilityItemID: map['availabilityItemID'] as String,
      name: map['name'] as String,
      notes: map['notes'] as String,
      phoneNumber: map['phoneNumber'] as String,
      moveInTimeStamp: map['moveInTimeStamp'] as String,
      userID: map['userID'] as String,
      furnitureMovingService: map['furnitureMovingService'] as bool,
      property: Property.fromMap(map['property']),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'timeStamp': this.timeStamp,
      'availabilityItemID': this.availabilityItemID,
      'name': this.name,
      'notes': this.notes,
      'phoneNumber': this.phoneNumber,
      'moveInTimeStamp': this.moveInTimeStamp,
      'userID': this.userID,
      'property': this.property.toMap(),
      'furnitureMovingService': this.furnitureMovingService,
    } as Map<String, dynamic>;
  }
}