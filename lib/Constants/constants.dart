import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:iram/Models/user.dart';

class Constant {
  static const Color appColor = Color(0xffFFFFFF);
  static const Color backgroundColor = Color(0xff002042);
  static const Color blueColor = Color(0xff5E99F8);
  static const Color darkblue = Color(0xff3A67AE);
  static const Color searchbarplaceholdercolor = Color(0xffD3D3D3);
  static const List cats = [
    "All",
    "Apartments",
    "Condos",
    "Studio Apartments",
    "Farms",
    "Offices",
    "Storage",
    "Recreational",
    "House"
  ];
  static const List positions = [
    "All",
    "View on 3 streets",
    "View on 2 streets",
    "Corner house",
    "with passage",
    "with 2 passages"
  ];
  // static const List Asimah = [
  // "Abdullah Al-Salem"
  // "Adiliya",
  // "Bneid Al-Qar",
  // "Al Da'iya",
  // "Al Dasma" ,
  // "Dasman",
  // "Sharq",
  // "Al Faiha",
  // "Faylakah",
  // "Kaifan",
  // "Khaldiya",
  // "Kuwait City(capital)",
  // "Al Mansouriah",
  // "Murgab",
  // "Al-Nuzha",
  // "Al Qadisiya",
  // "Qurtoba",
  // "Rawdah",
  // "Al Shamiya",
  // "Al Shuwaikh",
  // "Sulaibikhat",
  // "Al Surra",
  // "Al Yarmouk",
  // ];
  // static const List Havalli = [
  //   "Hawalli",
  //   "Bayan",
  //   "Mishref",
  //   "Maidan Hawalli",
  //   "Jabriya",
  //   "Rumaithiya",
  //   "Salmiya",
  //   "Salwa",
  //   "Shaab",
  //   "Al-salam",
  //   "Hattin",
  //   "Al-Zahra",
  //   "Mubarak Al Abdullah Al Jaber",
  //   "Al-shuhada",
  //   "Al-badae",
  //   "Al-Siddiq"
  // ];
  // static const List Mubarak = [
  //   "Abu Futaira",
  //   "Adān",
  //   "Al-Qurain District",
  //   "Funaitees",
  //   "Messila",
  //   "Mubarak Al-Kabeer",
  //   "Qusūr",
  //   "Sabah Al-Salem"
  // ];
  // static const List Ahmadi = [
  //   "Abu Halifa",
  //   "Al-Ahmadi",
  //   "Al-Eqaila",
  //   "Daher",
  //   "Fahaheel",
  //   "Fintas",
  //   "Hadyia",
  //   "Jaber Al Ali",
  //   "Mahboula",
  //   "Mangaf",
  //   "Riqqa",
  //   "Subahiya",
  //   "Sabah Al-Ahmad Sea City",
  //   "Wafra",
  // ];
  // static const List Farwaniya = [
  //   "Abrag Khitan",
  //   "Al Andalus",
  //   "Ishbilia",
  //   "Jleeb Al Shouyouk",
  //   "Omariya",
  //   "Ardiya",
  //   "Industrial Ardiya",
  //   "Fordous",
  //   "Farwaniya",
  //   "Shadadiya",
  //   "Rihab",
  //   "Rabiya"
  //   "Industrial Rai",
  //   "Abdullah Al Mubarak",
  //   "Dajeej",
  //   "South Khaitan",
  // ];
  // static const List Jahra = [
  //   "Alabdally",
  //   "Albhaith",
  //   "Aljahra",
  //   "Alkhwaisat",
  //   "Almutlaa",
  //   "Alnaeem",
  //   "Alnaseem",
  //   "Aloyoon",
  //   "Alqaser",
  //   "Alretqah",
  //   "Alroudhatain",
  //   "Alsalmy",
  //   "Alsubbyah",
  //   "Alsulaibya",
  //   "Alwaha",
  //   "Amghara",
  //   "Boubyan island",
  //   "Jaber Alahmad City",
  //   "Kabd",
  //   "Kazma",
  //   "Om Alaish",
  //   "Saad Alabdaullah City",
  //   "Silk City",
  //   "Taimaa",
  //   "Warbah island"
  // ];
  // static const List governorates = [
  //   "Al Asimah Governorate",
  //   "Hawalli",
  //   "Farwaniya",
  //   "Mubarak Al-Kabeer",
  //   "Ahmadi",
  //   "Jahra",
  // ];
  static const List AsimahA = [
    "All",
    "Abdullah Al-Salem"
        "Adiliya",
    "Bneid Al-Qar",
    "Al Da'iya",
    "Al Dasma" ,
    "Dasman",
    "Sharq",
    "Al Faiha",
    "Faylakah",
    "Kaifan",
    "Khaldiya",
    "Kuwait City(capital)",
    "Al Mansouriah",
    "Murgab",
    "Al-Nuzha",
    "Al Qadisiya",
    "Qurtoba",
    "Rawdah",
    "Al Shamiya",
    "Al Shuwaikh",
    "Sulaibikhat",
    "Al Surra",
    "Al Yarmouk",
  ];
  static const List HavalliA = [
    "All",
    "Hawalli",
    "Bayan",
    "Mishref",
    "Maidan Hawalli",
    "Jabriya",
    "Rumaithiya",
    "Salmiya",
    "Salwa",
    "Shaab",
    "Al-salam",
    "Hattin",
    "Al-Zahra",
    "Mubarak Al Abdullah Al Jaber",
    "Al-shuhada",
    "Al-badae",
    "Al-Siddiq"
  ];
  static const List MubarakA = [
    "All",
    "Abu Futaira",
    "Adān",
    "Al-Qurain District",
    "Funaitees",
    "Messila",
    "Mubarak Al-Kabeer",
    "Qusūr",
    "Sabah Al-Salem"
  ];
  static const List AhmadiA = [
    "All",
    "Abu Halifa",
    "Al-Ahmadi",
    "Al-Eqaila",
    "Daher",
    "Fahaheel",
    "Fintas",
    "Hadyia",
    "Jaber Al Ali",
    "Mahboula",
    "Mangaf",
    "Riqqa",
    "Subahiya",
    "Sabah Al-Ahmad Sea City",
    "Wafra",
  ];
  static const List FarwaniyaA = [
    "All",
    "Abrag Khitan",
    "Al Andalus",
    "Ishbilia",
    "Jleeb Al Shouyouk",
    "Omariya",
    "Ardiya",
    "Industrial Ardiya",
    "Fordous",
    "Farwaniya",
    "Shadadiya",
    "Rihab",
    "Rabiya"
        "Industrial Rai",
    "Abdullah Al Mubarak",
    "Dajeej",
    "South Khaitan",
  ];
  static const List JahraA = [
    "All",
    "Alabdally",
    "Albhaith",
    "Aljahra",
    "Alkhwaisat",
    "Almutlaa",
    "Alnaeem",
    "Alnaseem",
    "Aloyoon",
    "Alqaser",
    "Alretqah",
    "Alroudhatain",
    "Alsalmy",
    "Alsubbyah",
    "Alsulaibya",
    "Alwaha",
    "Amghara",
    "Boubyan island",
    "Jaber Alahmad City",
    "Kabd",
    "Kazma",
    "Om Alaish",
    "Saad Alabdaullah City",
    "Silk City",
    "Taimaa",
    "Warbah island"
  ];
  static const List governoratesA = [
    "All",
    "Al Asimah Governorate",
    "Hawalli",
    "Farwaniya",
    "Mubarak Al-Kabeer",
    "Ahmadi",
    "Jahra",
  ];
  static const List all = [
    "All",
  ];
}
