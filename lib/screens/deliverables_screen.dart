import 'package:flutter/material.dart';
import 'package:simplonline/models/deliverable.dart';
import 'package:simplonline/widgets/deliverable_card.dart';

class DeliverablesScreen extends StatefulWidget {
  @override
  _DeliverablesScreenState createState() => _DeliverablesScreenState();
}

class _DeliverablesScreenState extends State<DeliverablesScreen> {
  List<Deliverable> _deliverables = [
    Deliverable(
        id: "",
        title: "deliverable title",
        description: "deliverable description",
        briefId: "briefId",
        studentId: "studentId",
        submissionDate: DateTime.now())
  ]; // Placeholder data, replace with actual data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliverables'),
      ),
      body: ListView.builder(
        itemCount: _deliverables.length,
        itemBuilder: (context, index) {
          return DeliverableCard(deliverable: _deliverables[index]);
        },
      ),
    );
  }
}
