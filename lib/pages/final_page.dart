import 'package:flutter/material.dart';
import 'dart:math';

class FinalPage extends StatelessWidget {
  final double loanAmount;
  final double loanTerm;
  final double interestRate;

  const FinalPage({
    Key? key,
    required this.loanAmount,
    required this.loanTerm,
    required this.interestRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double monthlyInterestRate = interestRate / 100 / 12;
    double monthlyPayment = (loanAmount * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -loanTerm));
    double totalInterest = monthlyPayment * loanTerm - loanAmount;
    double totalPayment = loanAmount + totalInterest;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Detalles del préstamo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildDetailRow(
                  'Monto del préstamo',
                  'S/ ${loanAmount.toStringAsFixed(2)}',
                  valueColor: const Color(0xFFFFC107),
                ),
                _buildDetailRow(
                  'Periodo en meses',
                  loanTerm.toString(),
                  valueColor: const Color(0xFF1A1A1A),
                ),
                _buildDetailRow(
                  'Interés mensual %',
                  '${(interestRate / 12).toStringAsFixed(2)} %',
                  valueColor: const Color(0xFFEF5350),
                ),
                _buildDetailRow(
                  'Cuota mensual',
                  'S/ ${monthlyPayment.toStringAsFixed(2)}',
                  valueColor: const Color(0xFFFFC107),
                ),
                _buildDetailRow(
                  'Total de interés a pagar',
                  'S/ ${totalInterest.toStringAsFixed(2)}',
                  valueColor: const Color(0xFFFFC107),
                ),
                _buildDetailRow(
                  'Total a pagar',
                  'S/ ${totalPayment.toStringAsFixed(2)}',
                  valueColor: const Color(0xFFFFC107),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Acción para sacar el préstamo
                    },
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text('Saca tu préstamo'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      backgroundColor: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.black)),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: valueColor ?? Colors.black),
          ),
        ],
      ),
    );
  }
}
