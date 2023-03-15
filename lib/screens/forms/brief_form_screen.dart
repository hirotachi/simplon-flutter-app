import 'package:flutter/material.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simplonline/models/brief.dart';
import 'package:simplonline/providers/briefs_provider.dart';

class BriefFormScreen extends StatefulWidget {
  final String _title;
  final Brief? _brief;

  const BriefFormScreen({super.key, String? title, Brief? brief})
      : _brief = brief,
        _title = title ?? "Brief form";

  @override
  _BriefFormScreenState createState() => _BriefFormScreenState();
}

class _BriefFormScreenState extends State<BriefFormScreen> {
  bool _isEditing = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime _deadline = DateTime.now();
  List<String> _technologies = [];
  List<String> _skills = [];

  @override
  void initState() {
    super.initState();
    if (widget._brief != null) {
      _isEditing = true;
      _titleController.text = widget._brief!.title;
      _descriptionController.text = widget._brief!.description;
      _deadline = widget._brief!.deadline;
      _technologies = widget._brief!.technologies;
      _skills = widget._brief!.skills;
    }
  }

  void _submit() {
    // Implement your brief creation logic here
    var brief = widget._brief ??
        Brief(
          title: _titleController.text,
          description: _descriptionController.text,
          deadline: _deadline,
          technologies: _technologies,
          skills: _skills,
          groupId: "",
        );

    final briefsProvider = Provider.of<BriefsProvider>(context, listen: false);
    if (_isEditing) {
      // copy the brief and update it
      brief.title = _titleController.text;
      brief.description = _descriptionController.text;
      brief.deadline = _deadline;
      brief.technologies = _technologies;
      brief.skills = _skills;

      briefsProvider.updateBrief(brief);
    } else {
      briefsProvider.addBrief(brief);
    }
    Navigator.pop(context); // Return to the previous screen
  }

  Future<void> _selectDeadline(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 5)),
    );
    if (picked != null && picked != _deadline) {
      setState(() {
        _deadline = picked;
      });
    }
  }

  Widget _buildInputChips({
    required Function(List<String>) onChanged,
    String? hintText = "Add a value",
    String? label,
    List<String> initialValue = const [],
  }) {
    return FlutterInputChips(
      initialValue: initialValue,
      onChanged: onChanged,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        // bottom border
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      inputDecoration: InputDecoration(
        label: Text(label ?? ""),
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _selectDeadline(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Deadline',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(_deadline == null
                      ? ''
                      : DateFormat('yyyy-MM-dd').format(_deadline)),
                ),
              ),
              const SizedBox(height: 8),
              _buildInputChips(
                initialValue: _technologies,
                label: "Technologies",
                hintText: "Add a technology",
                onChanged: (value) {
                  setState(() {
                    _technologies = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              _buildInputChips(
                initialValue: _skills,
                label: "Skills",
                hintText: "Add a skill",
                onChanged: (value) {
                  setState(() {
                    _skills = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  ),
                  child: Text(widget._brief == null ? "Create" : "Update")),
            ],
          ),
        ),
      ),
    );
  }
}
