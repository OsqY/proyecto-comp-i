import 'package:flutter/material.dart';
import 'package:flutter_proyecto/pages/login_page.dart';
import 'package:flutter_proyecto/pages/request_form.dart';
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
      title: 'Proyecto',
      initialRoute: '/login',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainWidget(),
        '/requestInfo': (context) => const RequestInfoPage(),
        '/requests': (context) => const RequestsPage(),
        '/create_new_request': (context) => const RequestForm(),
      },
    );
  }
}
