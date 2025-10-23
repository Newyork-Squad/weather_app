import 'package:flutter/material.dart';

class LocationDisplayComponent extends StatelessWidget {
  final String locationName;

  final Color textColor;
  final double fontSize;
  final double iconSize;

  const LocationDisplayComponent({
    super.key,
    required this.locationName,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.location_on, color: textColor, size: iconSize),

        const SizedBox(width: 2.0),

        Text(
          locationName,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
