import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            flex: 4,
            child: SizedBox(
              height: 300,
              child: RiveAnimation.asset(
                'assets/empty.riv',
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
