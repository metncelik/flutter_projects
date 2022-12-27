import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/models/time_zones.dart';
import 'package:flutter_world_time_app/models/world_time.dart';

class SearchBarDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData.dark();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQueries = [];
    for (String zone in timezones) {
      if (zone.toLowerCase().contains(query.toLowerCase())) {
        matchQueries.add(zone);
      }
    }
    return ListView.builder(
        itemCount: matchQueries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchQueries[index]
                .replaceAll(RegExp(r'_'), ' ')
                .replaceAll(RegExp(r'/'), ' / ')),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQueries = [];
    for (String zone in timezones) {
      if (zone.toLowerCase().contains(query.toLowerCase())) {
        matchQueries.add(zone);
      }
    }
    return ListView.builder(
        itemCount: matchQueries.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              final navigator = Navigator.of(context);
              WorldTime worldTime = WorldTime(url: matchQueries[index]);
              await worldTime.getTime();
              navigator.pop(worldTime);
            },
            title: Text(matchQueries[index]
                .replaceAll(RegExp(r'_'), ' ')
                .replaceAll(RegExp(r'/'), ' / ')),
          );
        });
  }
}
