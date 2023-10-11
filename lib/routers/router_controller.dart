import 'package:go_router/go_router.dart';

import 'package:core_flutter_bloc/features/weather/presentation/presentation.dart';

part 'weather_routes.dart';

// GoRouter configuration
final routerController = GoRouter(
  initialLocation: '/weather',
  routes: [
    ..._weatherRoutes,
  ],
);
