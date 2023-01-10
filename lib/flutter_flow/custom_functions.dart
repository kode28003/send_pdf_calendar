import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

DateTime getFutureDateTime(DateTime? value) {
  // Add your function code here!
  value ??= DateTime.now();

  return value.add(const Duration(hours: 23, minutes: 59));
}

String returnStringData(DateTime data) {
  // Add your function code here!
  return data.month.toString() + "/" + data.day.toString();
}

String toString(String? value) {
  // Add your function code here!
  return value.toString();
}

DateTime getEndMonthTimestamp(
  int? valueMonth,
  int? valueYear,
) {
  final DateTime begin = DateTime(valueYear!, valueMonth! + 1, 1, 0, 0);
  final DateTime end = begin.subtract(const Duration(seconds: 1));
  return end;
}

DateTime getBeginMonthTimestamp(
  int? valueMonth,
  int? valueYear,
) {
  // Add your function code here!
  final DateTime begin = DateTime(valueYear!, valueMonth!, 1, 0, 0);
  return begin;
}

int getYear(DateTime? value) {
  // Add your function code here!
  return value!.year.toInt();
}

int getMonth(DateTime? value) {
  // Add your function code here!
  return value!.month.toInt();
}

dynamic returnJsonEmail(List<String>? shareUserEmailList) {
  // json emailJsonCode = []
  //   for (String shareUseEmail in shareUserEmailList!) {
  //   String currentJsonCode = '{"email": "$shareUseEmail"}';
  //   emailJsonCode = emailJsonCode + currentJsonCode;
  //   if (shareUserEmailList.last != shareUseEmail) {
  //     emailJsonCode = emailJsonCode + ",";
  //   } else {
  //     emailJsonCode = emailJsonCode + "]";
  //   }
  // }

  // List<Map<String,dynamic>> value = json.encode(
  //   emailJsonCode);

  // return value;

  List<Map<String, String>> emailJsonCode = [];
  shareUserEmailList ??= [];
  for (final shareUserEmail in shareUserEmailList) {
    emailJsonCode.add({"email": shareUserEmail});
  }

  return json.encode(emailJsonCode);
}

String? returnIdFromJson(dynamic jsonValue) {
  return jsonValue['id'];
}

String? returnIsoTimeFormat(DateTime? value) {
  final isoTimeFormat = value!.toIso8601String();
  final googleApiTime = isoTimeFormat + "+09:00";
  //final googleApiTime = isoTimeFormat.replaceAll("Z", "+09:00");
  return googleApiTime;
}
