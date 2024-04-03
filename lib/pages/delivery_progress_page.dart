import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Progress'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // delivery progress
          Expanded(
            child: Column(
              children: [
                // delivery status
                const Text('Delivery Status: Out for Delivery'),

                // delivery progress bar
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}