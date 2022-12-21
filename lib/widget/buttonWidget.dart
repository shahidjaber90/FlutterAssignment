import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';

buttonFunction(img, text) {
  return TextButton(
    onPressed: () {},
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: ColorConstants.btnOutlineColor),
      ),
    )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundImage: AssetImage(img),
            backgroundColor: ColorConstants.primaryColor,
            radius: 14),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: ColorConstants.textColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

buttonLoginFunction(img) {
  return TextButton(
    onPressed: () {},
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        // side: BorderSide(color: ColorConstants.btnOutlineColor),
      ),
    )),
    child: CircleAvatar(
        backgroundImage: AssetImage(img),
        backgroundColor: ColorConstants.primaryColor,
        radius: 14),
  );
}
