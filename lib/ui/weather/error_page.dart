import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/strings.dart';

class ErrorPage extends StatelessWidget {
  final String text;
  final VoidCallback onRetry;

  ErrorPage({required this.text, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Container()),
        Text(text),
        SizedBox(height: Paddings.linePadding),
        ElevatedButton(onPressed: onRetry, child: Text(Strings.buttonRetry)),
        Expanded(child: Container())
      ],
    );
  }
}
