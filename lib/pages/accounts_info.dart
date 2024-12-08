import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cuenta = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de la Cuenta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.white,
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
                Text('Cuenta ID: ${cuenta['cuentaId']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Cliente ID: ${cuenta['customerId']}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Saldo Inicial: \$${cuenta['saldoInicial']}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Cuota Aporte: \$${cuenta['cuotaAporte']}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Saldo: \$${cuenta['saldo']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 10),
                Text('Fecha de Creación: ${cuenta['fechaCreacion']}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Fecha de Préstamo: ${cuenta['fechaPrestamo']}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Estado: ${cuenta['estado'] ? 'Activo' : 'Inactivo'}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}