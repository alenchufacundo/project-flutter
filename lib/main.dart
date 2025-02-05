import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/screens/movie_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_base/providers/movie_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_movie_form_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // Carga el archivo de configuración
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
      create: (context) => MovieProvider()..fetchMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(onThemeChanged: _toggleTheme),
          '/add-movie': (context) => AddMovieFormScreen(),
          '/movie-list': (context) => MovieListScreen(),
        },
      ),
    );
  }
}
