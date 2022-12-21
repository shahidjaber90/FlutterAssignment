import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';

// bool isObscurePassword = true;

Widget buildTextField(
      placeholder, icon) {
  return Padding(
    padding:const EdgeInsets.only(bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          labelText: placeholder,
                          suffixIcon: icon,
            contentPadding:const EdgeInsets.only(left: 10.0),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(fontSize: 16, color: ColorConstants.orColor),
                          ),
                    ),
      ],
    ),
  );
}
