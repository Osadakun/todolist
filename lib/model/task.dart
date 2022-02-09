import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// class Task {
//   List<String> items;     // メモ内容を複数持てるように
//   bool isDone;            // 完了したかどうか
//   Position address;       // 位置情報

//   Task({required this.items, this.isDone = false, required this.address});
// }

class Task {
  String title;
  bool isDone;
  // String uid;
  DateTime createdTime;
  DateTime? updatedTime;

  Task({required this.title, required this.isDone, required this.createdTime, this.updatedTime });
}