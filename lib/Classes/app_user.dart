import 'package:country_code_picker/country_code.dart';

class AppUser {
  String firstName,email, lastName,imgurl, id, phoneNumber, firstAddress,secondAddress;
  CountryCode country;
  AppUser(
      {this.firstName, this.lastName,this.imgurl,this.email, this.id, this.firstAddress,this.secondAddress,this.phoneNumber, this.country});

  factory AppUser.fromMap(Map map) {
    return new AppUser(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      id: map['id'] as String,
      phoneNumber: map['phoneNumber'] as String,
      imgurl: map['imgurl'] as String,
      email: map['email'] as String,
      firstAddress: map['firstAddress'] as String,
      secondAddress: map['secondAddress'] as String,
      country: map['country'] as CountryCode,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'id': this.id,
      'phoneNumber': this.phoneNumber,
      'imgurl': this.imgurl,
      'secondAddress': this.secondAddress,
      'email': this.email,
      'firstAddress': this.firstAddress,
      'country': this.country,
    } as Map<String, dynamic>;
  }
}
