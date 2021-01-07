import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pilgrim/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pilgrim/src/bloc/observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(
    () async {
      Bloc.observer = CrashlyticsBlocObverser();
      await Firebase.initializeApp();
      InAppPurchaseConnection.enablePendingPurchases();
      var path = await getApplicationDocumentsDirectory();
      Hive..init(path.path);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      await Hive.openBox('datetimes');
      runApp(
        AppInit(),
      );
    },
    (e, st) => FirebaseCrashlytics.instance.recordError(e, st),
  );
}
