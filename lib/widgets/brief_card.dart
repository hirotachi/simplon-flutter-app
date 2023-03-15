import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplonline/models/brief.dart';
import 'package:simplonline/providers/briefs_provider.dart';
import 'package:simplonline/screens/forms/brief_form_screen.dart';

class BriefCard extends StatelessWidget {
  final Brief brief;

  BriefCard({required this.brief});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onUpdate(context),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _confirmDelete(context),
            ),
          ],
        ),
        title: Text(brief.title),
        subtitle: Text(brief.description),
        onTap: () {
          // Navigate to brief details screen
        },
      ),
    );
  }

  void onUpdate(context) {
    // Navigate to update brief screen
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BriefFormScreen(
                title: "Update Brief",
                brief: brief,
              )),
    );
  }

  void onDelete(context) {
    final briefsProvider = Provider.of<BriefsProvider>(context, listen: false);
    briefsProvider.removeBrief(brief);
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Brief'),
        content: Text('Are you sure you want to delete this brief?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDelete(context);
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
