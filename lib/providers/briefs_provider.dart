import 'package:flutter/foundation.dart';
import 'package:simplonline/models/brief.dart';

class BriefsProvider with ChangeNotifier {
  List<Brief> _briefs = [];

  List<Brief> get briefs => _briefs;

  void addBrief(Brief brief) {
    _briefs.add(brief);
    notifyListeners();
  }

  void removeBrief(Brief brief) {
    _briefs.remove(brief);
    notifyListeners();
  }

  void updateBrief(Brief brief) {
    final index = _briefs.indexWhere((element) => element.id == brief.id);
    _briefs[index] = brief;
    notifyListeners();
  }
}
