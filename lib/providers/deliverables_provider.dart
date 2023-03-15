import 'package:flutter/foundation.dart';
import 'package:simplonline/models/deliverable.dart';

class DeliverablesProvider with ChangeNotifier {
  List<Deliverable> _deliverables = [];

  List<Deliverable> get deliverables => _deliverables;

  void addDeliverable(Deliverable deliverable) {
    _deliverables.add(deliverable);
    notifyListeners();
  }
}
