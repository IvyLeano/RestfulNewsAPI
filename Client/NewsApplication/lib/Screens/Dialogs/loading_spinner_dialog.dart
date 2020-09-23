import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

loadingSpinnerDialog(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.all(10),
            backgroundColor: Colors.transparent,
            shape: CircleBorder(),
            child: Center(
                child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                    )
                )
            )
        );
      });
}
