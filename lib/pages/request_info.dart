import 'package:flutter/material.dart';

class RequestInfoPage extends StatelessWidget {
  const RequestInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de Solicitud'),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Propósito...',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Tasa de solicitud',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Plazo',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Monto',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Estado',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 30.0,
            width: 300.0,
            child: Text(
              'Fecha de solicitud',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
