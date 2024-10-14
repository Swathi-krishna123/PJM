import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text heading( String heading) {
    return  Text(
                heading,
                style:  TextStyle(
                    fontSize: 20.h,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff283343)),
              );
  }