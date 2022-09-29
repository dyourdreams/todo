import 'package:flutter/material.dart';
import 'package:todo/mystyles.dart';
import 'package:todo/utl/my_buttons.dart';

class DialogBoxScreen extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCanceled;
  DialogBoxScreen({Key? key,
  required this.controller,
  required this.onSaved,
  required this.onCanceled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.shade100,
      content: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: controller,
              maxLines: 5,
              minLines: 2,
              decoration: const InputDecoration(
                hintText: 'write new task...',
                border: OutlineInputBorder(),
                
              ),
            ),
            //Add & cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: 'Add', onPressed: onSaved),
                Mybutton(text: 'Cancel', onPressed: onCanceled)
              ],
            )
          ],
        ),
      ),
    );
  }
}