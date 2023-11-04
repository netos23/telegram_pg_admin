import 'package:flutter/material.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/pg_admin_app.dart';

Future<void> main() async {
  await AppComponents().init();

  runApp(PgAdminApp());
}

