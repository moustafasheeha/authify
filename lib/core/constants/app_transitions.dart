import 'package:flutter/animation.dart';
import 'package:get/get.dart';

abstract class AppTransitions {

  static const Transition defaultTransition = Transition.fadeIn;


  static const Duration defaultDuration = Duration(milliseconds: 400);


  static const Curve defaultCurve = Curves.easeInOut;
}