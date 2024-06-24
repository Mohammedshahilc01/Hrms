
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
const FlutterSecureStorage storage=FlutterSecureStorage();

class GlobalVariable{
 static GlobalKey<ScaffoldState> key = GlobalKey();
}

class StorageData{
 static writeSecureData(String key, String value) async {
  await storage.write(key: key, value: value);
 }
}