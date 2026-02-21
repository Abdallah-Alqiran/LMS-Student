import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_student/core/routing/app_routes.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => Scaffold(body: Text("Hello")),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => Container(),
      ),
      // GoRoute(
      //   path: AppRoutes.loginScreen,
      //   name: AppRoutes.loginScreen,
      //   builder: (context, state) {
      //     return BlocProvider(
      //       create: (context) => sl<AuthCubit>(),
      //       child: LoginScreen(),
      //     );
      //   },
      // ),
    ],
  );
}
