import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/ui/widgets/pickers/equipment/equipment_picker_input.dart';

class ServiceOrderCreateForm extends StatefulWidget {
  @override
  State createState() {
    return _ServiceOrderCreateFormState();
  }
}

class _ServiceOrderCreateFormState extends State<ServiceOrderCreateForm> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildText(String label){
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      style: textTheme.title.copyWith(fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          labelText: label,
          hasFloatingPlaceholder: true
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fieldList = [
      EquipmentPickerInput(),
      _buildText('Serviço'),
      _buildText('Observação'),
    ].map((field) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: field,
      );
    }).toList();
      return Form(
        key: _formKey,
        child: ListView(
          children: fieldList,
          padding: EdgeInsets.all(5.0),
        ),
      );
  }
}