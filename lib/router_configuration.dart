import 'package:bogamego/src/lobby/main_scaffold.dart';
import 'package:bogamego/src/screens/on_board.dart';
import 'package:bogamego/src/screens/lobby.dart';
import 'package:bogamego/src/screens/ranking.dart';
import 'package:bogamego/src/screens/settings.dart';
import 'package:bogamego/src/screens/shop.dart';
import 'package:bogamego/src/screens/splash.dart';
import 'package:bogamego/src/settings/settings_controller.dart';
import 'package:bogamego/src/sign_in/sign_in_screen.dart';
import 'package:bogamego/src/style/palette.dart';
import 'package:bogamego/src/user/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../screens/inventory.dart';

class RouterConfiguration extends StatelessWidget {
  RouterConfiguration({super.key});

  final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/signIn',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/deeplink',
        redirect: (_,__) => '/',
      ),
      GoRoute(
        path: '/signIn',
        builder: (_, __) => const SignInScreen(),
      ),
      ShellRoute(
          navigatorKey: shellKey,
          builder: (context, state, child)=>MainScaffold(child: child),
          routes:[
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) {
                return const MaterialPage(child: ShopScreen());
              },
            ),
            GoRoute(
              path: '/inventory',
              pageBuilder: (context, state) {
                return const MaterialPage(child: InventoryScreen());
              },
            ),
            GoRoute(
              path: '/lobby',
              pageBuilder: (context, state) {
                return const MaterialPage(child: LobbyScreen());
              },
            ),
            GoRoute(
              path: '/ranking',
              pageBuilder: (context, state) {
                return const MaterialPage(child: RankingScreen());
              },
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) {
                return MaterialPage(child: SettingsScreen());
              },
            )
          ]
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ko'), // Spanish
        Locale('ja'), // Spanish
      ],

      routerConfig: router,
    );
  }
}
