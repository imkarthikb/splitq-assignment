import 'package:flutter/material.dart';
import 'package:splitq/ui/index.dart';

final kStyleButtonPrimary = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(kColorPrimary),
  padding:
      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 16)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(72),
  )),
);

final kStyleButtonText = ButtonStyle(
  padding:
      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 16)),
);
