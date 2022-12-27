import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/models/time_zones.dart';
import 'package:flutter_world_time_app/models/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getWorldTime() async {
    //context may change during the build
    //so instead of Navigator.pushReplacementNamed(context,'/home') store the context
    final navigator = Navigator.of(context);

    WorldTime worldTime = WorldTime(
      url: timezones[271],
    );

    await worldTime.getTime();
    navigator.pushReplacementNamed('/home', arguments: worldTime);
  }

  @override
  void initState() {
    getWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
