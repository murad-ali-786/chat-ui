import 'package:flutter/material.dart';


import 'fav_app/custom_sun_brust.dart';

final List<SunburstData> chartData = [
  SunburstData(
    id: '1',
    parent: '',
    name: 'Root',
    label: 'Root',
    value: 100,
    color: '#34495E', // Dark Blue Gray
  ),
  SunburstData(
    id: '1.1',
    parent: '1',
    name: 'Sector A',
    label: 'Sector A',
    value: 40,
    color: '#2ECC71', // Emerald Green
  ),
  SunburstData(
    id: '1.2',
    parent: '1',
    name: 'Sector B',
    label: 'Sector B',
    value: 60,
    color: '#3498DB', // Sky Blue
  ),
  SunburstData(
    id: '1.1.1',
    parent: '1.1',
    name: 'Company A1',
    label: 'Company A1',
    value: 20,
    color: '#58D68D', // Light Green
  ),
  SunburstData(
    id: '1.1.2',
    parent: '1.1',
    name: 'Company A2',
    label: 'Company A2',
    value: 20,
    color: '#27AE60', // Darker Green
  ),
  SunburstData(
    id: '1.2.1',
    parent: '1.2',
    name: 'Company B1',
    label: 'Company B1',
    value: 30,
    color: '#5DADE2', // Light Sky Blue
  ),
  SunburstData(
    id: '1.2.2',
    parent: '1.2',
    name: 'Company B2',
    label: 'Company B2',
    value: 30,
    color: '#21618C', // Deep Blue
  ),
];


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sunburst Chart Example')),
        body: Scaffold(body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SunburstChart(chartData: chartData),
          ],
        )),
      ),
    );
  }
}
