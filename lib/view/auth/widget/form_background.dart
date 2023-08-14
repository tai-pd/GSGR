import 'package:flutter/material.dart';

class FormBackground extends StatelessWidget {
  final String title;

  const FormBackground({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 32),
        Text(title ?? '',
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30)),
        const SizedBox(height: 8),
        Text(
          'Please enter your credentials in the form bellow:',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 24),
        Container(
          color: Colors.amberAccent,
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/formBackground.png',
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ]);
}
