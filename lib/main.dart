import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'themes/volcanik_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
