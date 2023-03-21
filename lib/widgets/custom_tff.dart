import 'package:flutter/material.dart';
class CustomTff extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String alertMessage;
  const CustomTff({Key? key,
    required this.text,
    required this.alertMessage,
    required this.controller})
      : super(key: key);

  @override
  State<CustomTff> createState() => _CustomTffState();
}

class _CustomTffState extends State<CustomTff> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        labelText: widget.text,
        fillColor: Colors.grey,
      ),
      validator: (text){
        text!.isEmpty ||
            !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(text)
            ? widget.alertMessage
            : null;
      },
    );
  }
}

class CustomNff extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String alertMessage;
  const CustomNff({Key? key,
    required this.text,
    required this.alertMessage,
    required this.controller}) : super(key: key);

  @override
  State<CustomNff> createState() => _CustomNffState();
}

class _CustomNffState extends State<CustomNff> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        labelText: widget.text,
        fillColor: Colors.grey,
      ),
      validator: (text){
        text!.isEmpty || !RegExp(r'^[ 0-9]+$').hasMatch(text) ? 'Invalid value' : null;
      },
    );
  }
}

