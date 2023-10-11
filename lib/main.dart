import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:core_flutter_bloc/features/weather/presentation/blocs/blocs.dart';
import 'package:core_flutter_bloc/routers/router_controller.dart';
import 'injection_container.dart' as di;

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(189, 224, 254, 1),
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(189, 224, 254, 1),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListLocationBloc>(
          create: (_) => di.sl<ListLocationBloc>(),
        ),
        BlocProvider<WeatherBloc>(
          create: (_) => di.sl<WeatherBloc>(),
        )
      ],
      child: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: routerController,
    );
  }
}
