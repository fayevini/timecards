import 'dart:collection';

import 'package:flutter/material.dart';
import 'reusablecard.dart';

class CardData extends ChangeNotifier{
  List<ReusableCard> _cards = [];

UnmodifiableListView<ReusableCard> get cards {
  return UnmodifiableListView(_cards);
}

  void addReusableCard(String activity, int goal, double elapsed,
      bool state, Function onPress, Function onLongPress) {
  final newCard = ReusableCard(activityText: activity,
    activityLength: goal,
    activityTimeElapsed: elapsed,
    enabled: state,
    singlePress: onPress,
    longPress: onLongPress);
     _cards.add(newCard);
     notifyListeners();
  }
}