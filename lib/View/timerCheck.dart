import 'package:flutter/material.dart';

import '../Controller/Widget/TextWidget.dart';
class Regularize extends StatefulWidget {
  const Regularize({super.key});

  @override
  State<Regularize> createState() => _RegularizeState();
}

class _RegularizeState extends State<Regularize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: TextData(
              name: 'Regularize',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          TextField(
            // controller: _controller,
            decoration: new InputDecoration(
              hintText: 'Type something',
            ),
          ),
        ],
      ),
    );
  }
}
