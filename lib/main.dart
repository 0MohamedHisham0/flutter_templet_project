import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_templet_project/shared/MyBlocObserver.dart';
import 'package:flutter_templet_project/shared/network/local/chace_helper.dart';
import 'package:flutter_templet_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_templet_project/shared/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          home: const Directionality(
              textDirection: TextDirection.rtl, child: Text('GG')),
        ));
  }
}
