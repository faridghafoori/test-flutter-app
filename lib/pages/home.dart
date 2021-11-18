import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color textColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgImage'),
                fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      if (result != null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location_alt_outlined,
                      color: textColor,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: textColor),
                    )),
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/' + data['flag'],
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 20, color: textColor),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['isDaytime'].toString(),
                      style: TextStyle(fontSize: 20, color: textColor),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
