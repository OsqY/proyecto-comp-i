import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Balances extends StatelessWidget {
  const Balances({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Mis Saldos',
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40.0,
        ),
        const Text(
          'Préstamos',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: 40,
                  title: '40%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: 30,
                  title: '30%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 30,
                  title: '10%',
                  radius: 50,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Ahorros',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: 40,
                  title: '40%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: 30,
                  title: '30%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 30,
                  title: '10%',
                  radius: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
