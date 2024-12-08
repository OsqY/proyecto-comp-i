import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';

class BalancesPage extends StatefulWidget {
  const BalancesPage({super.key});

  @override
  _BalancesPageState createState() => _BalancesPageState();
}

class _BalancesPageState extends State<BalancesPage> {
  final String prestamosUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Prestamo/GetAllDue";
  final String solicitudesUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Solicitud/GetAllSolit";

  Future<List<dynamic>> fetchPrestamos() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(prestamosUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar préstamos');
    }
  }

  Future<List<dynamic>> fetchSolicitudes() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(solicitudesUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar solicitudes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balances'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Préstamos',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              FutureBuilder<List<dynamic>>(
                future: fetchPrestamos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No hay préstamos'));
                  } else {
                    return SizedBox(
                      height: 300,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          barGroups:
                              snapshot.data!.map<BarChartGroupData>((prestamo) {
                            return BarChartGroupData(
                              x: prestamo['prestamoId'],
                              barRods: [
                                BarChartRodData(
                                  width: 30,
                                  y: prestamo['monto'].toDouble(),
                                  colors: [Colors.blue],
                                ),
                              ],
                            );
                          }).toList(),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(
                              showTitles: true,
                            ),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTitles: (double value) {
                                return 'ID ${value.toInt()}';
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
