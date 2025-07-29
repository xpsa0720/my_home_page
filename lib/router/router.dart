import 'package:go_router/go_router.dart';
import 'package:my_page/page/home.dart';

final MainRouter = GoRouter(
  initialLocation: Home.routeFullPath,
  routes: [
    GoRoute(
      path: Home.routeFullPath,
      builder: (context, state) {
        return Home();
      },
    ),
  ],
);
