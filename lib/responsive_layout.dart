
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'HomepagePhone.dart';

class Responsivelayout extends StatelessWidget {
  const Responsivelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth < 600) {
          return const HomepagePhone();
        } else {
          return const homepage();
        } 
      },
    );
  }
}
