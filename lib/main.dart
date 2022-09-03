
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:la_vie/layout/home_layout/home_layout.dart';
import 'package:la_vie/modules/auth_screens/auth_screen.dart';
import 'package:la_vie/shared/api/remote/dio_helper.dart';
import 'package:la_vie/shared/bloc_observer.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/auth_cubit/auth_cubit.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/forums_cubit/forums_cubit.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_cubit.dart';
import 'package:la_vie/shared/cubit/profile_cubit/profile_cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/themes/themes.dart';

Widget startScreenDoctor = const AuthScreen();

Future<void> startScreen() async {
  await Hive.initFlutter();
  final box = await Hive.openBox(boxName);
  // dark mode
  final isDark = await box.get(isDarkBox);
  AppCubit.isDark = isDark ?? false;
  //
  refreshTokenConst = await box.get(refreshTokenBox);
  accessTokenConst = await box.get(accessTokenBox);
  userIdConst = await box.get(userIdBox);
  if (refreshTokenConst != null && accessTokenConst != null&&userIdConst!=null) {
    startScreenDoctor = HomeLayout();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await EasyLocalization.ensureInitialized();
  await startScreen();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  EasyLocalization.logger.enableBuildModes = [];
  // TODO: preview mode
  if (kDebugMode) {
    runApp(
      DevicePreview(
        builder: (context) =>
            EasyLocalization(
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', 'EG'),
              ],
              path: 'assets/translation',
              child: const MyApp(),
            ),
      ),
    );
  } else {
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path: 'assets/translation',
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ForumsCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startScreenDoctor,
          );
        },
      ),
    );
  }
}
