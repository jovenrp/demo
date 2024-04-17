

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nrd/features/add_product/data/models/hive_product_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;

import 'application/providers/bloc_provider.dart';
import 'application/repositories/local_repository/memory_repository.dart';
import 'application/repositories/local_repository/secured_local_repository.dart';
import 'application/repositories/local_repository/unsecured_local_repository.dart';
import 'application/services/persistence_service.dart';
import 'features/splash/bloc/splash_bloc.dart';
import 'features/splash/bloc/splash_state.dart';
import 'features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    // Log or handle the error details
    //print(details);
  };

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  PersistenceService persistenceService = PersistenceService(
    SecuredLocalRepository(const fss.FlutterSecureStorage()),
    UnsecuredLocalRepository(sharedPreferences),
    MemoryRepository(),
  );

  runApp(MyApp(persistenceService: persistenceService));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.persistenceService});

  final PersistenceService persistenceService;


  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();

    var path = Directory.systemTemp.path;
    Hive
      ..init(path)
      ..registerAdapter(HiveProductModelAdapter());
  }

  @override
  Widget build(BuildContext context) {
    final List<SingleChildWidget> blocs = BlocsProvider.provide(persistenceService: widget.persistenceService,);

    List<SingleChildWidget> providers = <SingleChildWidget>[
      ...blocs,
    ];
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: providers,
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (BuildContext context, SplashState state) {
            // Handle
            if (!state.isLoading) {

            }
          },
          builder: (BuildContext context, __) => MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              // Define the default brightness and colors.
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
                brightness: Brightness.light,
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}