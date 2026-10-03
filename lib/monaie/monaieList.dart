// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MonaieList extends StatefulWidget {
  final Map<String, String> map;

  MonaieList(this.map);

  @override
  _MonaieListState createState() => _MonaieListState();
}

class _MonaieListState extends State<MonaieList> {
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
