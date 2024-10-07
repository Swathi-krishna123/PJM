import 'package:flutter/material.dart';

Text heading( String heading) {
    return  Text(
                heading,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff283343)),
              );
  }