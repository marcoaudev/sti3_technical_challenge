import 'package:flutter/material.dart';
import 'package:sti3_app/app/view/home_page.dart';
import 'package:sti3_app/app/view/pedido/pedidos_page.dart';
import 'package:sti3_app/app/view/relatorio/relatorios_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromRGBO(34, 154, 167, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(34, 154, 167, 1),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          iconTheme: IconThemeData(color: Colors.white)
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromRGBO(34, 154, 167, 1),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromRGBO(34, 154, 167, 1)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(34, 154, 167, 1),
            iconColor: Colors.white,
            textStyle: const TextStyle(color: Colors.white),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))
            )
          )
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/pedidos': (context) => const PedidosPage(),
        '/relatorios': (context) => const RelatoriosPage(),
      },
    );
  }
}
