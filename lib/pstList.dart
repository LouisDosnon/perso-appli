// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PstList extends StatefulWidget {
  final Map<String, String> map;

  PstList(this.map);

  @override
  _PstListState createState() => _PstListState();
}

class _PstListState extends State<PstList> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> values = widget.map.values.toList();
    List<String> keys = widget.map.keys.toList();
    return ListView.builder(
      itemCount: widget.map.length,
      itemBuilder: (context, index) {
        var value = values[index];
        var key = keys[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
                  title: Text(value),
                  subtitle: Text(key),
            )),
          ]),
        );
      },
    );
  }
}
