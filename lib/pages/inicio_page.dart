import 'package:flutter/material.dart';
import 'second_page.dart'; // Agrega esta línea

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFffc2d1), width: 2),
                ),
                // NO ME JALA LA IMAGEN PROFE
                /* child: Image.network(
                  'https://i.pinimg.com/564x/11/e6/94/11e6944cfa46a33d2e5dee895b3f7f43.jpg',
                  fit: BoxFit.contain,
                ),*/
              ),
              const SizedBox(height: 30),
              const Text(
                'Calculadora de prestamos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Obtenga un prestamo bancario con solo unos cuantos clicks ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Navegación a la página second_page.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.play_arrow, color: Color(0xFFffc2d1)),
                    SizedBox(width: 10),
                    Text(
                      'Siguiente',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemComponentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text('Item Component'),
    );
  }
}