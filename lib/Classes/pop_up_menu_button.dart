import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Classes/custom_text.dart';
import 'package:realestate/Constants/constants.dart';

class MyPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<dynamic>> popupItems;
  final void Function(dynamic newValue) onSelected;
  final double elevation;
  final Icon icon;
  final double iconSize;
  final EdgeInsets padding;

  MyPopupMenuButton({@required this.popupItems,
    @required this.onSelected,
    this.elevation = 8.0,
    this.icon = const Icon(Icons.keyboard_arrow_down, color: Colors.black),
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(0.0)});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
      elevation: elevation,
      onSelected: onSelected,
      icon: SvgPicture.asset("Assets/arrowbut.svg",
          height: 5, color: Colors.white),
      iconSize: iconSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      padding: EdgeInsets.all(0),
      itemBuilder: (context) => popupItems,
    );
  }
}
