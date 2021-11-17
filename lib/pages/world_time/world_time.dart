import 'package:flutter/material.dart';

class WorldTimePage extends StatefulWidget {
  const WorldTimePage({Key? key}) : super(key: key);

  @override
  _WorldTimePageState createState() => _WorldTimePageState();
}

class _WorldTimePageState extends State<WorldTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/location");
              },
              icon: const Icon(
                Icons.edit_location_alt_outlined,
                color: Colors.black,
              ),
              label: const Text(
                'Edit Location',
                style: TextStyle(color: Colors.black),
              )),
        ],
      )),
    );
  }
}
