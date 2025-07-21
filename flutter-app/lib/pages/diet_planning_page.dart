import 'package:flutter/cupertino.dart';

class DietPlanningPage extends StatelessWidget {
  const DietPlanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Diet Planning'),
      ),
      child: Center(
        child: Text('Your Meal Plan'),
      ),
    );
  }
}