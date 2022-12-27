import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/models/world_time.dart';

import 'location_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorldTime data = WorldTime.empty(url: "");

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        data.getTime();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.location == "location"
        ? ModalRoute.of(context)!.settings.arguments as WorldTime
        : data;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                filterQuality: FilterQuality.high,
                opacity: 0.5,
                fit: BoxFit.cover,
                image: AssetImage("assets/${data.bg}"))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () async {
                  try {
                    WorldTime sworldTime = await showSearch(
                        context: context,
                        delegate: SearchBarDelegate()) as WorldTime;
                    setState(() {
                      data = sworldTime;
                    });
                  } catch (e) {
                    null;
                  }
                },
                child: Chip(
                  deleteIcon: const Icon(Icons.search),
                  onDeleted: () async {
                    try {
                      WorldTime sworldTime = await showSearch(
                          context: context,
                          delegate: SearchBarDelegate()) as WorldTime;
                      setState(() {
                        data = sworldTime;
                      });
                    } catch (e) {
                      null;
                    }
                  },
                  elevation: 2,
                  padding: const EdgeInsets.all(12.0),
                  avatar: const Icon(
                    size: 40,
                    Icons.location_on_rounded,
                    color: Colors.red,
                  ),
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.location.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        data.region,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    data.getTime();
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                      Icons.access_time_filled,
                      size: 55,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      data.time,
                      style: const TextStyle(
                        shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
