import 'package:flutter/material.dart';
import 'package:simplonline/models/deliverable.dart';

class DeliverableCard extends StatelessWidget {
  final Deliverable deliverable;

  DeliverableCard({required this.deliverable});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(deliverable.title),
        subtitle: Text(deliverable.description),
        onTap: () {
          // Navigate to deliverable details screen
        },
      ),
    );
  }
}
