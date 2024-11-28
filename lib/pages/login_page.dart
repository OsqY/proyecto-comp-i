import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Correo',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: InputBorder.none,
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Contraseña',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: InputBorder.none,
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
