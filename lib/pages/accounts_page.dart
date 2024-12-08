import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final String apiUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Cuenta/GetAllAccounts";
  final String customersUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Customer/GetAllCustomer";
  final String accountsByCustomerUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Cuenta/GetAllByCustomer";

  List<dynamic> customers = [];
  int? selectedCustomerId;

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(customersUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        customers = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error al cargar clientes');
    }
  }

  Future<List<dynamic>> fetchAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar cuentas');
    }
  }

  Future<List<dynamic>> fetchAccountsByCustomer(int customerId) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse('$accountsByCustomerUrl?id=$customerId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar cuentas por cliente');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<int>(
              hint: const Text('Seleccionar Cliente'),
              value: selectedCustomerId,
              onChanged: (int? newValue) {
                setState(() {
                  selectedCustomerId = newValue;
                });
              },
              items: customers.map<DropdownMenuItem<int>>((dynamic customer) {
                return DropdownMenuItem<int>(
                  value: customer['customerId'],
                  child:
                      Text('${customer['nombres']} ${customer['apellidos']}'),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: selectedCustomerId == null
                  ? fetchAccounts()
                  : fetchAccountsByCustomer(selectedCustomerId!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay cuentas'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final cuenta = snapshot.data![index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(
                            'Cuenta ID: ${cuenta['cuentaId']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Saldo Inicial: \$${cuenta['saldoInicial']}'),
                              Text('Cuota Aporte: \$${cuenta['cuotaAporte']}'),
                              Text('Saldo: \$${cuenta['saldo']}'),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/accountInfo',
                                arguments: cuenta);
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
