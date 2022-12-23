import 'package:flutter/material.dart';


class CustomErrorWidget extends StatelessWidget {
  final String message;
   CustomErrorWidget({
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(message),
      ),
    );
  }
}
