import 'package:flutter/material.dart';

class UiHelper {

static CustomTextField (TextEditingController controller, String text, IconData icon, bool toHide ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal : 25.0, vertical: 15),
    child: TextFormField(
      controller: controller,
      obscureText: toHide,
      // keyboardType: TextInputType.,
      // validator: validator,
      decoration: InputDecoration(
        labelText: text,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
  
}

//   for button
static CustomButton (String text, VoidCallback voidCallback) {
  return SizedBox(
    height: 50,
    width: 200,
    child: ElevatedButton(
      onPressed: voidCallback,
      child: Text(text),
    ),
  );
}

// custom alert box
static CustomAlertBox (BuildContext context, String text ) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
        // content: Text(text),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: const Text('Close'),
        //   ),
        // ],
      );
    },
  );
}
}