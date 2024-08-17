import 'package:flutter/material.dart';
import 'inicio_page.dart'; // Asegúrate de importar tu página de inicio

class ThankYouPage {
  static void showApprovalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(24.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 60,
                color: Color(0xFFFFC107),
              ),
              const SizedBox(height: 16),
              const Text(
                '¡Felicidades!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Su crédito fue aprobado',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => InicioPage()),
                    (Route<dynamic> route) => false, // Elimina todas las rutas anteriores
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text('Volver'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}