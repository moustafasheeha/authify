import 'package:flutter/material.dart';

class Animatedline extends StatelessWidget {
  const Animatedline({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      builder: (context, glow, child) {
        return Container(
          width: 160,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(glow),
                Colors.white.withOpacity(glow * 0.2),
              ],
            ),
          ),
        );
      },
    );
  }
}
