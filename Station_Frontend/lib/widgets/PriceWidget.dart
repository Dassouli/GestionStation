import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prix des carburants:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Diesel: \$1.50',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Essence: \$2.00',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        Text(
          'Services associés:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Service 1',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Service 2',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
