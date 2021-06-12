import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:himatif_event/services/services.dart';
import 'package:himatif_event/shared/shared.dart';
import 'package:himatif_event/ui/pages/pages.dart';
import 'package:provider/provider.dart';

import 'cubit/cubit.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await LocalNotification.showNotification(message);
  print('Notifikasi Layar Belakang Berhasil');
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        await LocalNotification.showNotification(message);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(mainColor);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UsersCubit(),
        ),
        BlocProvider(
          create: (_) => EventCubit(),
        ),
        BlocProvider(
          create: (_) => CategoryCubit(),
        ),
        BlocProvider(
          create: (_) => CurrentCubit(),
        ),
        BlocProvider(
          create: (_) => JoineventCubit(),
        )
      ],
      child: StreamProvider.value(
        value: AuthEmailServices.userStream,
        initialData: null,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenMain(),
        ),
      ),
    );
  }
}
