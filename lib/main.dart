import 'package:bytebank/views/transferencia/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BitebankApp());

class BitebankApp extends StatelessWidget {
  const BitebankApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.green,
          secondary: Colors.blueAccent,
          background: Colors.white,
          surface: Colors.grey,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light, 
          error: Colors.red,
        ),
      ),
    );
  }
}








