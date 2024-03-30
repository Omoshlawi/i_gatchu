import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/features/auth/data/models/auth_state.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/ChangePassword.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/LoginScreen.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/RegistrationScreen.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/ResetPasswordScreen.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/SplashScreen.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/VerificationScreen.dart';
import 'package:i_gatchu/src/features/auth/presentation/pages/WelcomeScreen.dart';
import 'package:i_gatchu/src/features/common/presentation/pages/MainScreen.dart';
import 'package:i_gatchu/src/features/emmergency/presentations/pages/EmergencyAlerts.dart';
import 'package:i_gatchu/src/features/emmergency/presentations/pages/PsychosocialSupport.dart';
import 'package:i_gatchu/src/features/emmergency/presentations/pages/ReportEmmegencyIncident.dart';
import 'package:i_gatchu/src/features/user/presentation/pages/ProfileScreen.dart';
import 'package:i_gatchu/src/features/user/presentation/pages/ProfileWizardFormScreen.dart';
import 'package:i_gatchu/src/features/user_preference/presentation/pages/PinAuthScreen.dart';
import 'package:i_gatchu/src/features/user_preference/presentation/pages/PrivacySettingsScreen.dart';
import 'package:i_gatchu/src/utils/routes.dart';

final routesProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    // debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router.redirectLogic,
    routes: router.routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<AuthState>>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }

  FutureOr<String?> redirectLogic(BuildContext context, GoRouterState state) {
    final AsyncValue<AuthState> loginState_ = _ref.watch(authStateProvider);
    final areWeInOpenRoutes = state.matchedLocation.startsWith("/auth");
    // handle with loading loading
    if (loginState_.isLoading) return "/splash";

    // Handle with error
    if (loginState_.hasError && areWeInOpenRoutes) return null;
    if (loginState_.hasError && !areWeInOpenRoutes) return "/auth/login";
    // Handle with value
    final loginState = loginState_.requireValue;
    // Is user not logged in and accessing open route then let them be?
    if (!loginState.isAuthenticated && areWeInOpenRoutes) return null;
    // if not logged in and trying to accept secure root then redirect to login
    if (!loginState.isAuthenticated && !areWeInOpenRoutes) return "/auth/login";
    // If user already logged in and moving on open routes then redirect to home
    if (loginState.isAuthenticated == true && areWeInOpenRoutes) return '/';
    // If user is logged in bt not verified account the redirect to verification
    if (loginState.isAuthenticated && !loginState.isAccountVerified) {
      return '/account-verify';
    }
    // If user is logged in bt not completed profile account the redirect to profile update screen
    if (loginState.isAuthenticated && !loginState.isProfileComplete) {
      return '/profile-edit';
    }

    return null;
  }

  FutureOr<String?> _localRedirectLogic(
      BuildContext context, GoRouterState state) {
    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          name: RouteNames.SPLASH_SCREEN,
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          name: RouteNames.WELCOME_SCREEN,
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
          routes: openRoutes,
        ),
        GoRoute(
          name: RouteNames.LANDING_SCREEN,
          path: '/',
          builder: (context, state) => const MainScreen(),
          routes: secureRoutes,
        ),
        GoRoute(
          name: RouteNames.VERIFY_ACCOUNT,
          path: '/account-verify',
          builder: (BuildContext context, GoRouterState state) {
            return const VerificationScreen();
          },
        ),
        GoRoute(
          name: RouteNames.PROFILE_EDIT_FORM,
          path: '/profile-edit',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileWizardFormScreen();
          },
        ),
      ];
}

final List<RouteBase> secureRoutes = [

  GoRoute(
    name: RouteNames.UNLOCK_SCREEN,
    path: 'unlock',
    builder: (BuildContext context, GoRouterState state) {
      return const PinAuthScreen();
    },
  ),
  GoRoute(
    name: RouteNames.CHANGE_PASSWORD,
    path: 'change-password',
    builder: (BuildContext context, GoRouterState state) {
      return const ChangePassword();
    },
  ),

  GoRoute(
    name: RouteNames.PRIVACY_SETTINGS,
    path: 'privacy-settings',
    builder: (BuildContext context, GoRouterState state) {
      return const PrivacySettingsScreen();
    },
  ),
  GoRoute(
    name: RouteNames.PROFILE_SETTINGS,
    path: 'profile',
    builder: (BuildContext context, GoRouterState state) {
      return const ProfileScreen();
    },
  ),GoRoute(
    name: RouteNames.VIEW_INCIDENTS,
    path: 'emergencies',
    builder: (BuildContext context, GoRouterState state) {
      return const EmergencyAlerts();
    },
    routes: emergencyRoutes
  ),
];
final List<RouteBase> openRoutes = [
  GoRoute(
    name: RouteNames.LOGIN_SCREEN,
    path: 'login',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    name: RouteNames.REGISTER_SCREEN,
    path: "sign",
    builder: (BuildContext context, GoRouterState state) {
      return const RegistrationScreen();
    },
  ),
  GoRoute(
    name: RouteNames.RESET_PASSWORD_SCREEN,
    path: 'reset-password',
    builder: (context, state) => const ResetPasswordScreen(),
  ),
];
final List<RouteBase> emergencyRoutes = [
  GoRoute(
    name: RouteNames.PSYCHOSOCIAL_SUPPORT,
    path: 'psychosocial-support',
    builder: (BuildContext context, GoRouterState state) {
      return const PsychosocialSupport();
    },
  ),
  GoRoute(
    name: RouteNames.REPORT_EMERGENCY_INCIDENT,
    path: 'report-emergency-incident',
    builder: (BuildContext context, GoRouterState state) {
      return const ReportEmergencyIncident();
    },
  ),
];