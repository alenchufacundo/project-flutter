import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/movie_provider.dart';
import 'screens/api/TopRatedMoviesScreen.dart';
import 'screens/home_screen.dart';
import 'helpers/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno
  await dotenv.load(fileName: "assets/env/.env");

  // Inicializar preferencias
  await Preferences.initShared();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = Preferences.darkmode;
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
      Preferences.darkmode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(onThemeChanged: _toggleTheme),
          '/puntuados': (context) {
            final provider = Provider.of<MovieProvider>(context, listen: false);
            provider.fetchMovies(); // Asegúrate de que solo se llame una vez
            return TopRatedMoviesScreen(onThemeChanged: _toggleTheme);
          },
        },
      ),
    );
  }
}
