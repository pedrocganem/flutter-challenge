import 'package:flutter/material.dart';

class SnowFAQCircleColorCell extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const SnowFAQCircleColorCell({this.color, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFF0F0F0),
                  blurRadius: 0,
                  offset: Offset(1.0, 1.0),

                )
              ],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4)),
        ),
        Container(
          height: 40,
          width: 40,
            child: isSelected
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : SizedBox()),
      ],
    );
  }
}
