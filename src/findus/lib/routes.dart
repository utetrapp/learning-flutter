import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'ui/screens/home/home_screen.dart';
import 'ui/screens/home/cubit/home_cubit.dart';

import 'ui/screens/dummies/dummy_screen1.dart';
import 'ui/screens/dummies/dummy_screen2.dart';

class ScreenPaths {
  static String home = '/';
  static String dummy1 = '/dummy1';
  static String dummy2 = '/dummy2';
}

final appRouter = GoRouter(
  initialLocation: ScreenPaths.home,
  routes: [
    GoRoute(
        path: ScreenPaths.dummy1,
        builder: (context, state) => const DummyScreen1()),
    GoRoute(
        path: ScreenPaths.dummy2,
        pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: DummyScreen2(),
            )),
    GoRoute(
      path: ScreenPaths.home,
      builder: (context, state) => BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: const HomeScreen(title: 'home'),
      ),
    )
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
    ),
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
