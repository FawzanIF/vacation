import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacation/shared/shared.dart';

class RowDetails extends StatelessWidget {
  // const RowDetails({ Key? key }) : super(key: key);
  final String det1;
  final String det2;
  final Color clr;
  final FontWeight weight;

  RowDetails({this.det1, this.det2, this.clr, this.weight});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/ceklis.png",
                  width: 30,
                  height: 30,
                ),
                Text(
                  det1,
                  style: blackTextStyle,
                ),
              ],
            ),
            Text(
              det2,
              style: GoogleFonts.poppins(color: clr, fontWeight: weight),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
