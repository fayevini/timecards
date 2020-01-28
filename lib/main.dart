import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'components/card_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          accentColor: kAccentColor,
        ),
        home: MainScreen(),
      ),
    );
  }
}

