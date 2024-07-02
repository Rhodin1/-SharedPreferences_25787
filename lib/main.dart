import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedpreferences/Provider/Provider.dart';
import 'package:sharedpreferences/Views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ChangeNotifierProvider(
        create: (BuildContext context) => UiProvider()..init(),
        child: Consumer<UiProvider>(
            builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dark theme',
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme:
                notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Settings(),
          );
        }),
      );
    });
  }
}
