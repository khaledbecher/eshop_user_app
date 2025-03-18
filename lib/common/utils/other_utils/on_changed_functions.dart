import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

void onDateOfBirthChanged(String value,TextEditingController controller){
  if (value.length == 2 || value.length == 5) {
    controller.value = TextEditingValue(
      text: '$value.',
      selection: TextSelection.collapsed(offset: '$value.'.length),
    );
  }
  if (value.length == 3 || value.length == 6) {
    controller.value = TextEditingValue(
      text: value.removeLast(),
      selection: TextSelection.collapsed(offset: value.removeLast().length),
    );
  }
}