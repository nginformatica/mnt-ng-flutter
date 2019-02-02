import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_item_picker.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_picker_option.dart';

class EquipmentPickerInput extends BaseItemPicker {

  static final _equipmentList = List.generate(100, (index) =>
    Equipment(
      name: 'CONDICIONADOR DE AR',
      id: 'AC0$index',
      localization: 'Ferramentaria'
    )
  );

  @override
  String getLabelText() => 'Equipamento';

  @override
  String getSearchHintText() => 'Pesquisar equipamento';

  @override
  int getItemsLength() => _equipmentList.length;

  @override
  BasePickerOption buildPickerOption(BuildContext context, int index) {
    final equipment = _equipmentList[index];

    return BasePickerOption(
      onPressed: () {
        Navigator.pop(context, equipment);
      },
      title: '${equipment.id} - ${equipment.name}',
      subtitle: equipment.localization,
    );
  }




}
