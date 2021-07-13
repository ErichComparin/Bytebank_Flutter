import 'package:flutter/material.dart';

import 'screens/transferencia/lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencias(),
      theme: ThemeData(
        primaryColor: Colors.indigo[600],
        accentColor: Colors.redAccent[700],
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.redAccent[700],
          ),
        ),
      ),
    );
  }
}
