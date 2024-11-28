import 'package:flutter/material.dart';
import 'package:flutter_proyecto/pages/balances_page.dart';
import 'package:flutter_proyecto/pages/create_new_request_page.dart';
import 'package:flutter_proyecto/pages/home_page.dart';
import 'package:flutter_proyecto/pages/profile_page.dart';
import 'package:flutter_proyecto/pages/requests_page.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  static const List _pages = [
    HomePage(),
    Balances(),
    CreateNewRequestPage(),
    RequestsPage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Saldos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Nueva Solicitud',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            label: 'Mis Solicitudes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
