import 'package:flutter/material.dart';
/*
* Buttons
* Text
* Column, Row
* Main-Axis and CrossAxis Alignment
* onPress event
* setState
* overflow problem, Scroll
* */
class ButtonsWidget extends StatefulWidget {

  @override
  State createState() => _ButtonsWidgetState();
}
class _ButtonsWidgetState extends State<ButtonsWidget>{
  String labelText = "Label";
  void _buttonClicked(String textToPrint){
    print(textToPrint);
    setState(() {
      labelText = textToPrint;
    });
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Row(children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () => _buttonClicked("Text Button Clicked"),
          child: const Text('Disabled'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () => _buttonClicked("Elevated Button Clicked"),
          child: const Text('Disabled'),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () => _buttonClicked("Outlined Button Clicked"),
          child: const Text('Disabled'),
        ),
        Text(labelText)
      ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      scrollDirection: Axis.horizontal,
    );
  }
}