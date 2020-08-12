import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(
    {@required String title,
    Function onPressed,
    Color filledColor,
    Color fontColor,
    Color borderColor}) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(40),
    hoverColor: Colors.transparent,
    child: Align(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical:0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: filledColor ?? Colors.transparent,
            border: borderColor != null
                ? Border.all(
                    color: borderColor,
                    width: 1,
                  )
                : null),
        child: Center(
          child: Text(
            title, style: TextStyle(
            fontSize: 16,
            color: fontColor ?? Colors.transparent
          ),
          ),
        ),
      ),
    ),
  );
}
