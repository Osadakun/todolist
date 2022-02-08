import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Task {
  List<String> items;     // メモ内容を複数持てるように
  bool isDone;            // 完了したかどうか
  Position address;       // 位置情報

  Task({required this.items, this.isDone = false, required this.address});
}
