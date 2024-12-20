import 'package:flutter/material.dart';

class RequestInfoPage extends StatelessWidget {
  const RequestInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final solicitud =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de la Solicitud'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Solicitud ID: ${solicitud['solicitudId']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Cliente ID: ${solicitud['customerId']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Propósito: ${solicitud['proposito']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Tasa de Interés: ${solicitud['tasaInteres']}%',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Plazo: ${solicitud['plazo']} meses',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Monto: \$${solicitud['monto']}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                const SizedBox(height: 10),
                Text('Fecha de Creación: ${solicitud['fechaCreacion']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Fecha de Préstamo: ${solicitud['fechaPrestamo']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Estado: ${solicitud['estado'] ? 'Activo' : 'Inactivo'}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
