import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final String apiUrl =
      "http://leonelh2024-001-site1.ntempurl.com/Solicitud/GetAllSolit";

  Future<List<dynamic>> fetchRequests() async {
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
      throw Exception('Error al cargar solicitudes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Solicitudes'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay solicitudes'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final solicitud = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(
                      'Solicitud ID: ${solicitud['solicitudId']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Propósito: ${solicitud['proposito']}'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/requestInfo',
                          arguments: solicitud);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
