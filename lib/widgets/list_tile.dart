import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback? onClicked;
  final Icon leadingIcon;
  final Text labelText;
  const CustomListTile({Key? key,
    required this.leadingIcon,
    required this.labelText, this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        tileColor: Colors.black,
        hoverColor: Colors.green[900],
        iconColor: Colors.amber,
        selectedTileColor: Colors.green,
        textColor: Colors.lightBlue,
        leading: leadingIcon,
        title: labelText,
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: onClicked,
      ),
    );
  }
}
