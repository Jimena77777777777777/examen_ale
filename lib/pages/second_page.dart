import 'package:flutter/material.dart';
import 'dart:math';
import 'thankyou_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double loanAmount = 10000;
  double loanTerm = 24;
  double interestRate = 44;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildLoanDetailCard('Monto del préstamo', loanAmount, min: 1000, max: 50000, unit: 'S/', onChange: (value) {
                    setState(() {
                      loanAmount = value;
                    });
                  }),
                  const SizedBox(height: 16),
                  _buildLoanDetailCard('Plazo del préstamo', loanTerm, min: 6, max: 36, unit: 'meses', onChange: (value) {
                    setState(() {
                      loanTerm = value;
                    });
                  }),
                  const SizedBox(height: 16),
                  _buildLoanDetailCard('Tasa de interés anual', interestRate, min: 10, max: 50, unit: '%', onChange: (value) {
                    setState(() {
                      interestRate = value;
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalPage(
                      loanAmount: loanAmount,
                      loanTerm: loanTerm,
                      interestRate: interestRate,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                backgroundColor: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanDetailCard(String title, double value, {required double min, required double max, required String unit, required ValueChanged<double> onChange}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$unit ${value.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC107),
              ),
            ),
            Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChange,
              activeColor: const Color(0xFFFFC107),
              inactiveColor: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$unit ${min.toStringAsFixed(2)}'),
                Text('$unit ${max.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
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
                _buildDetailRow('Monto del préstamo', 'S/ ${loanAmount.toStringAsFixed(2)}'),
                _buildDetailRow('Periodo en meses', loanTerm.toString()),
                _buildDetailRow('Interés mensual %', '${(interestRate / 12).toStringAsFixed(2)} %'),
                _buildDetailRow('Cuota mensual', 'S/ ${monthlyPayment.toStringAsFixed(2)}'),
                _buildDetailRow('Total de interés a pagar', 'S/ ${totalInterest.toStringAsFixed(2)}'),
                _buildDetailRow('Total a pagar', 'S/ ${totalPayment.toStringAsFixed(2)}'),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                       ThankYouPage.showApprovalDialog(context);// Acción para sacar el préstamo
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      backgroundColor: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Saca tu préstamo'),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.black)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFC107))),
        ],
      ),
    );
  }
}
