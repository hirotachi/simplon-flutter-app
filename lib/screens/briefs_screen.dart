import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplonline/providers/briefs_provider.dart';
import 'package:simplonline/widgets/brief_card.dart';

class BriefsScreen extends StatefulWidget {
  @override
  _BriefsScreenState createState() => _BriefsScreenState();
}

class _BriefsScreenState extends State<BriefsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BriefsProvider>(
      builder: (context, briefsProvider, child) {
        final _briefs = briefsProvider.briefs;
        return Scaffold(
            appBar: AppBar(
              title: Text("Briefs"),
            ),
            body: _briefs.isEmpty
                ? const Center(
                    child: Text("No briefs yet"),
                  )
                : ListView.builder(
                    itemCount: _briefs.length,
                    itemBuilder: (context, index) {
                      return BriefCard(brief: _briefs[index]);
                    },
                  ));
      },
    );
  }
}
