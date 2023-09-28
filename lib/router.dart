import 'package:flutter_mood/authentication/repos/authentication_repo.dart';
import 'package:flutter_mood/screens/home_screen.dart';
import 'package:flutter_mood/screens/main_navigation_screen.dart';
import 'package:flutter_mood/screens/post_screen.dart';
import 'package:flutter_mood/screens/sign_up_screen.dart';
import 'package:flutter_mood/screens/sign_in_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.matchedLocation != SignUpScreen.routeURL &&
              state.matchedLocation != SignInScreen.routeURL) {
            return SignUpScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          name: SignInScreen.routeName,
          path: SignInScreen.routeURL,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          name: MainNavigationScreen.routeName,
          path: MainNavigationScreen.routeURL,
          builder: (context, state) => const MainNavigationScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeURL,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: PostScreen.routeName,
          path: PostScreen.routeURL,
          builder: (context, state) => const PostScreen(),
        ),
      ]);
});
