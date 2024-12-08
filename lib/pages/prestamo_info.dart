import 'package:flutter/material.dart';

class PrestamoInfoPage extends StatelessWidget {
  const PrestamoInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prestamo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del Préstamo'),
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
                Text('Préstamo ID: ${prestamo['prestamoId']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Cliente ID: ${prestamo['clienteId']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Tasa de Interés: ${prestamo['tasaInteres']}%',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Plazo: ${prestamo['plazo']} meses',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Monto: \$${prestamo['monto']}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                const SizedBox(height: 10),
                Text('Saldo: \$${prestamo['saldo']}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
                const SizedBox(height: 10),
                Text('Fecha de Creación: ${prestamo['fechaCreacion']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Fecha de Préstamo: ${prestamo['fechaPrestamo']}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Estado: ${prestamo['estado'] ? 'Activo' : 'Inactivo'}',
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
