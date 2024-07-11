import 'package:flutter/material.dart';
import 'package:appjulio/items_list.dart';

class MyCustomFormWithNavigation extends StatefulWidget {
  const MyCustomFormWithNavigation({Key? key}) : super(key: key);

  @override
  MyCustomFormWithNavigationState createState() {
    return MyCustomFormWithNavigationState();
  }
}

class MyCustomFormWithNavigationState
    extends State<MyCustomFormWithNavigation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150, // Altura personalizada para la AppBar
        title: const Center(
          child: Text('Bienvenido al Sistema'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa su usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Simular un bloqueo de interfaz con un retraso
                      await Future.delayed(const Duration(seconds: 2));

                      // Navegar al screen del ListView
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SpacedItemsList(),
                        ),
                      );
                    }
                  },
                  child: const Text('Ingresar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
