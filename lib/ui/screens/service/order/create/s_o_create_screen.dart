import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/ui/screens/service/order/create/s_o_create_form.dart';

class ServiceOrderCreateScreen extends StatefulWidget {
  @override
  State createState() => _ServiceOrderCreateScreenState();
}

class _ServiceOrderCreateScreenState extends State<ServiceOrderCreateScreen> {

  @override
  void initState() {
    super.initState();
  }

  PreferredSizeWidget _buildAppBar(){
    return AppBar(
      title: Text('Criar nova O.S'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
          child: ServiceOrderCreateForm()
      ),
    );
  }
}
