import 'package:flutter/material.dart';
import 'package:mynt/core/resources/app_context.dart';
import 'package:mynt/presentation/widgets/show_success_snack_bar.dart';
import 'package:mynt/presentation/widgets/show_warning_snack_bar.dart';
import 'show_failure_snack_bar.dart';

enum ToastStates { success, error, warning }

extension ToastBGColorX on ToastStates {
  Color color() {
    switch (this) {
      case ToastStates.success:
        return Colors.green;
      case ToastStates.warning:
        return Colors.amber;

      case ToastStates.error:
        return Colors.red;
    }
  }
}

class SimpleToast {
  static void show({
    required String msg,
    Color? color,
    Color? textColor,
    ToastStates state = ToastStates.success,
  }) {
    if (state == ToastStates.success) {
      showSuccessSnackBar(AppContext.context, msg);
    } else if (state == ToastStates.warning) {
      showWarningSnackBar(AppContext.context, msg);
    } else {
      showFailureSnackBar(AppContext.context, msg);
    }
    // Fluttertoast.showToast(
    //   msg: msg,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: color ?? state.color(),
    //   textColor: textColor ?? Colors.white,
    //   fontSize: 16.0,
    // );
  }
}
