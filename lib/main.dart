import 'package:flutter/material.dart';
import 'package:flutter_proyecto/pages/customers_page.dart';
import 'package:flutter_proyecto/pages/accounts_info.dart';
import 'package:flutter_proyecto/pages/accounts_page.dart';
import 'package:flutter_proyecto/pages/login_page.dart';
import 'package:flutter_proyecto/pages/prestamo_info.dart';
import 'package:flutter_proyecto/pages/prestamos_page.dart';
import 'package:flutter_proyecto/pages/request_info.dart';
import 'package:flutter_proyecto/pages/requests_page.dart';
import 'package:flutter_proyecto/widgets/main_widget.dart';
import 'package:flutter_proyecto/theme/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación Financiera',
      initialRoute: '/login',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainWidget(),
        '/requests': (context) => const RequestsPage(),
        '/requestInfo': (context) => const RequestInfoPage(),
        '/loans': (context) => const PrestamosPage(),
        '/loanInfo': (context) => const PrestamoInfoPage(),
        '/accounts': (context) => const AccountsPage(),
        '/accountInfo': (context) => const AccountInfoPage(),
        '/customers': (context) => const CustomersPage(),
      },
    );
  }
}
