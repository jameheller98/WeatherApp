import 'package:go_router/go_router.dart';

import 'package:core_flutter_bloc/features/example/presentation/presentation.dart';

part 'example_routes.dart';

// GoRouter configuration
final routerController = GoRouter(
  initialLocation: '/login',
  routes: [
    ..._exampleRoutes,
  ],
);
