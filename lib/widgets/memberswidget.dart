import 'package:flutter/material.dart';

class MembersWidget extends StatefulWidget {
  String button;
  MembersWidget(this.button, {Key? key}) : super(key: key);

  @override
  State<MembersWidget> createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Members button ${widget.button}',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
