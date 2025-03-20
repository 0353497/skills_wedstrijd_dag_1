


import 'package:flutter/material.dart';

class OwnDropdown extends StatefulWidget {
  const OwnDropdown({super.key});

  @override
  State<OwnDropdown> createState() => _OwnDropdownState();
}

const List<String> list = <String>[
'opleiding 1',
'opleiding 2',
'opleiding 3',
'opleiding 4',
'opleiding 5',
'opleiding 6',
'opleiding 7',
'opleiding 8',
'opleiding 9',
'opleiding 10',
'opleiding 11',
'opleiding 12',
'opleiding 13',
'opleiding 14',
'opleiding 15',
];

class _OwnDropdownState extends State<OwnDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton<String>(
        value: null,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Color.fromARGB(255, 111, 207, 245)),
        underline: Container(height: 2, color: Color.fromARGB(255, 111, 207, 245)),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items:
            list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }
}