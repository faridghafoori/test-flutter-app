import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_flutter/services/world_time.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    if (instance.fetchData!) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'isDaytime': instance.isDaytime,
        'time': instance.time
      });
    } else {
      time = instance.time!;
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/lottie/data.json'),
      ),
    );
  }
}
