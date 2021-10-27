import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OverlapTransitionController extends ValueNotifier {
  OverlapTransitionController() : super(true);

  forward() => value = false;
  reverse() => value = true;
}
