import 'dart:isolate';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_application_1/screen/roteador_telas.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

@pragma('vm:entry-point')
void downloadCallback(String id, int status, int progress) {
  final SendPort? send = IsolateNameServer.lookupPortByName(
    'downloader_send_port',
  );

  send?.send([id, status, progress]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  FlutterDownloader.registerCallback(downloadCallback);

  final database = AppDatabase();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: database),
        Provider<Repository>(
          create: (context) =>
              Repository(database: context.read<AppDatabase>()),
        ),
        ChangeNotifierProvider(
          create: (context) => Storage(repository: context.read<Repository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BombeiroMG App',
      theme: ThemeData(
        cardTheme: const CardThemeData(color: Colors.white),
        searchBarTheme: const SearchBarThemeData(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),       
        iconTheme: const IconThemeData(color: Color(0xff8d1917)),
        textTheme: GoogleFonts.interTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffaa0104),
            foregroundColor: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xffF2F2F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffa3070a),
          foregroundColor: Colors.white,
          elevation: 10,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffD32F2F)),
      ),
      home: const RoteadorTelas(),
    );
  }
}
