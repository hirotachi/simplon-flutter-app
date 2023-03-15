import 'dart:math';

class Brief {
  final String id;
  late String title;
  late String description;
  late DateTime deadline;
  late List<String> technologies;
  late List<String> skills;
  final String groupId;

  Brief({
    required this.title,
    required this.description,
    required this.deadline,
    required this.technologies,
    required this.skills,
    required this.groupId,
  }) : id = _generateUniqueId();

  static String _generateUniqueId() {
    final random = Random();
    return 'brief_${random.nextInt(1000000)}';
  }
}
