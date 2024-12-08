import 'package:flutter/material.dart';
import 'package:flutter_proyecto/customers_page.dart';
import 'package:flutter_proyecto/pages/accounts_page.dart';
import 'package:flutter_proyecto/pages/home_page.dart';
import 'package:flutter_proyecto/pages/balances_page.dart';
import 'package:flutter_proyecto/pages/prestamos_page.dart';
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
    BalancesPage(),
    PrestamosPage(),
    RequestsPage(),
    AccountsPage(),
    CustomersPage(),
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
            icon: Icon(Icons.monetization_on),
            label: 'Préstamos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Solicitudes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Cuentas',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_outlined), label: 'Clientes'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
