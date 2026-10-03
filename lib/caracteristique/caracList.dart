// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CaracList extends StatefulWidget {
  final Map<String, String> list;

  CaracList(this.list);

  @override
  _CaracListState createState() => _CaracListState();
}

class _CaracListState extends State<CaracList> {

  @override
  Widget build(BuildContext context) {
    var values = widget.list.values;
    var keys = widget.list.keys;
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        var val = values.elementAt(index);
        var key = keys.elementAt(index);
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
                  title: Text(val),
                  subtitle: Text(key),
              )
            ),
          ]),
        );
      },
    );
  }
}
