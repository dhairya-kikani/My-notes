import 'package:flutter/cupertino.dart';

import 'generic_dialog.dart';

Future<void> showErrorDialoge(
  BuildContext context,
  String text
) {
  return showGenericDialog(
    context: context, 
    title: 'An error Occured', 
    content: text, 
    optionsBuilder: () =>{
      'OK' : null,
    },
    );
}