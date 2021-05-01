import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/extensions/extensions.dart';
import 'package:http/http.dart' as http;

part 'auth_service.dart';
part 'event_services.dart';
part 'users_services.dart';

part 'api/category_services_api.dart';
part 'api/event_services_api.dart';
part 'api/join_event_service_api.dart';
part 'api/users_services_api.dart';
part 'notifikasi/local_notification_services.dart';
part 'notifikasi/notifikasi_services.dart';

String baseURL = 'http://192.168.101.103:8000/api/';
String storageURL = 'http://192.168.101.103:8000/storage/';
