import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_it/common/utils.dart';

extension DialogUtils on Widget {
  Future<T?> showAsDialog<T>(
    BuildContext? context, {
    bool isMaterialDismissible = true,
  }) async =>
      isIOS
          ? showCupertinoDialog(
              context: context!,
              builder: (context) => this,
            )
          : showDialog(
              context: context!,
              builder: (context) => this,
              barrierDismissible: isMaterialDismissible,
            );
}
