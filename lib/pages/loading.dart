import 'package:flutter/material.dart';
import 'package:world_time/services/World_time.dart';
import 'package:world_time/TimeArguments.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final String routeName = '/home';

  //TODO: address context waring.
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'San Francisco', flag: 'germany.png', url: 'America/Los_Angeles');
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, routeName,
      arguments: TimeArguments(
          location: instance.location,
          flag: instance.flag,
          time: instance.time,
          isDayTime: instance.isDayTime),
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitWave(
            color: Colors.red,
            size: 50.0
          ),
        ),
      ),
    );
  }
}
