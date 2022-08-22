import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final IconData? icon;

  const EmptyScreen({required this.title, this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            width: 5,
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
