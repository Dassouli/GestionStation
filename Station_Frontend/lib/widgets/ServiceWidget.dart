import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final String serviceName;
  final String description;

  const ServiceWidget({
    Key? key,
    required this.serviceName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.room_service),
        title: Text(
          serviceName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          // Action to perform when the service item is tapped
          // For example, navigate to a detailed service screen
        },
      ),
    );
  }
}
