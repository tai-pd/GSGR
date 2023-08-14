import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  final List<Widget> children;
  final Widget button;

  const CardForm.button({
    @required this.children,
    @required this.button,
    Key key,
  }) : super(key: key);

  const CardForm({
    @required this.children,
    Key key,
  })  : this.button = null,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(bottom: 28),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(1),
                borderRadius: BorderRadius.all(const Radius.circular(6)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 20,
                    offset: Offset(0, 20),
                  )
                ]),
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 28, 20, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                )),
          ),
          if (button != null)
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: button,
            ),
        ]),
      );
}
