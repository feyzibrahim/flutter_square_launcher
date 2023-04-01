import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:sqaure_launcher/DateAndTime.dart';
import 'package:sqaure_launcher/GridView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future appFuture = DeviceApps.getInstalledApplications(
    includeAppIcons: true,
    includeSystemApps: true,
    onlyAppsWithLaunchIntent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: DateAndTIme(),
          ),
          Expanded(
            flex: 7,
            child: FutureBuilder<List<Application>>(
              future: appFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Application>> data) {
                if (data.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<Application> apps = data.data;
                  return GridViewByMine(
                    apps: apps,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
