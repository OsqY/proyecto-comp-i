import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Mi Perfil'),
        Container(
          width: 150.0,
          height: 200.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://user-images.githubusercontent.com/11250/39013954-f5091c3a-43e6-11e8-9cac-37cf8e8c8e4e.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text('Nombre'),
        const SizedBox(
          height: 10.0,
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Nombre',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text('Apellido'),
        const SizedBox(
          height: 10.0,
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Apellido',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text('DNI'),
        const SizedBox(
          height: 10.0,
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'DNI',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text('Clave'),
        const SizedBox(
          height: 10.0,
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Clave',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
