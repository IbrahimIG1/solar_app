import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/di.dart';
import 'package:solar/core/routing/app_router.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/theming/app_theme_data.dart';
import 'package:solar/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUp();
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  //         'https://cbbfc993d5fd65841a67b49890fc592c@o4507997126328320.ingest.us.sentry.io/4507997133864960';
  //     options.tracesSampleRate = 0.01;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Demo',
          theme: appThemeData(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: AppRouter().generateRoute,
          // home: const HomeScreen(),
        ),
      ),
    );
  }
}
