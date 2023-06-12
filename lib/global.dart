import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/service/storage_service.dart';

class Global {
  static late StorageService storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    storageServices = await StorageService().init();
  }
}
