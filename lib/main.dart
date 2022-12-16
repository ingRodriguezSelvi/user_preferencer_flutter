import 'package:flutter/material.dart';
import 'package:preferences_user/providers/theme_provider.dart';
import 'package:preferences_user/screens/screens.dart';
import 'package:preferences_user/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode))
    ],
    child: const MyApp()),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings User',
      initialRoute: HomeScreen.routerName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routerName     : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName : ( _ ) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
