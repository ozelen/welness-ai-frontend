import 'package:flutter/material.dart';

class DietPlanningPage extends StatelessWidget {
  const DietPlanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Planning'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Meal Plan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // TODO: Add meal planning widgets
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Meals',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Breakfast: Oatmeal with berries'),
                    Text('Lunch: Grilled chicken salad'),
                    Text('Dinner: Salmon with vegetables'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 