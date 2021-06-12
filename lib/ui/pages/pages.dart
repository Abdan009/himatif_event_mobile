import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as get2;
import 'package:himatif_event/cubit/cubit.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';
import 'package:himatif_event/shared/shared.dart';
import 'package:himatif_event/shared/utilities/constants.dart';
import 'package:himatif_event/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:himatif_event/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

part 'wrapper.dart';
part 'login_page.dart';
part 'register_page.dart';
part 'main_splash_screen.dart';
part 'admin/admin_main_page.dart';
part 'mahasiswa/mahasiswa_main_page.dart';
part 'mahasiswa/myEvent/main_myevent_mhs_page.dart';
part 'mahasiswa/myEvent/detail_registration_page.dart';

part 'mahasiswa/home_mhs_page.dart';
part 'mahasiswa/detail_event_mhs_page.dart';
part 'mahasiswa/profil_mhs_page.dart';
part 'mahasiswa/registration_event_page.dart';

part 'admin/event/event_admin_page.dart';
part 'admin/event/users_registration_page.dart';
part 'admin/registration/registration_admin_page.dart';
part 'admin/setting/setting_admin_page.dart';
part 'admin/users/list_user_admin_page.dart';
part 'admin/event/detail_event_page.dart';
part 'admin/event/update_event_admin_page.dart';
part 'admin/event/detail_registration_page.dart';

part 'admin/category/category_page.dart';
part 'admin/category/update_category_page.dart';
