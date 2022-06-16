import 'package:flutter/material.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user.dart';

class AppData {
  static final List<String> profileImages = [
    "assets/memoji/1.png",
    "assets/memoji/2.png",
    "assets/memoji/4.png",
    "assets/memoji/7.png"
  ];

  static final List<Color> groupBackgroundColors = [
    const Color(0xffBCF2C7),
    AppColors.bluePurple,
    const Color(0xffA5F69C),
    AppColors.lightPink,
  ];

  static final List<OnlineUser> onlineUsers = [];

  static final List<Map<String, dynamic>> employeeData = [
    {
      "employeeName": "Aaliyah Langosh",
      "employeeImage": "assets/girl_smile.png",
      "color": AppColors.lightPink,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
    {
      "employeeName": "Greta Streich",
      "employeeImage": "assets/man-head.png",
      "color": HexColor.fromHex("94F1F1"),
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Judd Koch",
      "employeeImage": "assets/memoji/7.png",
      "color": AppColors.bluePurple,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
    {
      "employeeName": "Katherine Wells",
      "employeeImage": "assets/memoji/2.png",
      "color": HexColor.fromHex("DBD0FD"),
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Betha Ramos",
      "employeeImage": "assets/memoji/9.png",
      "color": HexColor.fromHex("FFC5D5"),
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Greta Streich",
      "employeeImage": "assets/girl_smile.png",
      "color": HexColor.fromHex("94F1F1"),
      "activated": false,
      "employeePosition": "Dynamic Security Technician"
    },
    {
      "employeeName": "Aaliyah Langosh",
      "employeeImage": "assets/girl_smile.png",
      "color": AppColors.lightPink,
      "activated": true,
      "employeePosition": "Senior Interactions Agent"
    },
  ];
}
