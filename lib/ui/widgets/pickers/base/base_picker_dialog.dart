

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/ui/widgets/pickers/base/base_picker_search_input.dart';

class BasePickerDialog extends StatelessWidget {
  const BasePickerDialog({
    @required this.searchHintText,
    @required this.itemBuilder,
    @required this.childCount
  });

  final IndexedWidgetBuilder itemBuilder;
  final String searchHintText;
  final int childCount;


  Widget _buildList(){
    return SliverPadding(
        padding: EdgeInsets.only(bottom: 10.0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: childCount
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).viewInsets;
    final padding =  insets + EdgeInsets.all(10.0);

    // Same widgets as the original Dialog
    // Except the padding size
    return AnimatedPadding(
      padding: padding,
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 100),
      child: Material(
        elevation: 24.0,
        color:  Theme.of(context).dialogBackgroundColor,
        type: MaterialType.card,
        shape: DialogTheme.of(context).shape,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BasePickerSearchInput(hintText: 'Pesquisar'),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  _buildList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}