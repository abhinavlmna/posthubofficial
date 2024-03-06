import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posthub/app/size_utils.dart';
//import 'package:posthub/webservice/productprovider.dart';
//import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyARHB0j5CR6X5UPa6lhQQdWIuRAJ3An0q4",
        appId: "1:444093606773:android:d4012b89f1283264a8c13c",
        messagingSenderId: "444093606773",
        projectId: "fir-new-355ba",
        storageBucket: "fir-new-355ba.appspot.com"),
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
        );
      },
    );
  }
}
