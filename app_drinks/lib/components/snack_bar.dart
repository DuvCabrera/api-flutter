import 'package:flutter/material.dart';

 snackBarClickResponse(BuildContext context, String message, {Function? action, String label = 'nice'}){
   if(action == null){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 2),
     ));
   }else {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
       action: SnackBarAction(label: label, onPressed: () => action),
     ));
   }
 }