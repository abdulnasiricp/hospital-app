import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';

Widget authlogin(name, textcolor,image,concolor) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      child: Container(color: concolor,
        height: height / 17,
        width: width / 2.5,
        child: Row(
          children: [
            SizedBox(width: width/30),
            Image.asset(image,height: height/30),
            SizedBox(width: width/50),
            Text(
              name,
              style: TextStyle(
              color: textcolor, fontSize: 15, fontFamily: 'Gilroy_Medium'),
            ),
          ],
        ),
      ),
    ),
  );
}
