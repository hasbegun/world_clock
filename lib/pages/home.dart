import 'package:flutter/material.dart';
import 'package:world_time/TimeArguments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data={};
  @override
  Widget build(BuildContext context) {
    final TimeArguments data =
      ModalRoute.of(context)!.settings.arguments as TimeArguments;
    String bgImage = data.isDayTime ? 'day.png':'night.png';
    Color bgColor = data.isDayTime ? Colors.blue : Colors.indigo;

    print('${data.location}, ${data.flag}, ${data.time} ${bgImage}');
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget> [
                  ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data.setLocation(result.location);
                        data.setFlag(result.flag);
                        data.setTime(result.time);
                        data.setIsDayTime(result.isDayTime);
                      });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text('Edit Location')),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.location,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20.0,
                          letterSpacing: 2.0
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data.time,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 66.0,
                        letterSpacing: 2.0
                    ),
                  ),
              ],
            ),
        ),
          )
      ),
    );
  }
}

