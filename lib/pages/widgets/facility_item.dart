import 'package:flutter/material.dart';
import 'package:vacation/shared/shared.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  FacilityItem({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 40,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$name',
            style: blueTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
