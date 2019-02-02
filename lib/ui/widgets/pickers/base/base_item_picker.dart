
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_picker_dialog.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_picker_input.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_picker_option.dart';

abstract class BaseItemPicker extends StatelessWidget {
  const BaseItemPicker();

  @protected
  String getLabelText();

  @protected
  String getSearchHintText();

  @protected
  int getItemsLength();

  @protected
  BasePickerOption buildPickerOption(BuildContext context, int index);

  Widget _buildDialog(BuildContext context){
    return BasePickerDialog(
      searchHintText: getSearchHintText(),
      childCount:  getItemsLength(),
      itemBuilder: buildPickerOption,
    );
  }


  void _showDialogPicker(BuildContext context){
    showDialog(context: context, builder: _buildDialog);
  }

  @override
  Widget build(BuildContext context) {
    return BasePickerInput(
      onTap: () { _showDialogPicker(context); },
      labelText: getLabelText()
    );
  }
}



