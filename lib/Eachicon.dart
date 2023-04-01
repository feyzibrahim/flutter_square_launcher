import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class EachIcon extends StatefulWidget {
  final ApplicationWithIcon app;
  EachIcon({
    this.app,
  });

  @override
  _EachIconState createState() => _EachIconState();
}

class _EachIconState extends State<EachIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: FlatButton(
        onPressed: () {
          DeviceApps.openApp(widget.app.packageName);
        },
        onLongPress: () => _showBottom(context),
        splashColor: Colors.yellow[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: MemoryImage(widget.app.icon),
              width: 30.0,
            ),
            Text(
              "${widget.app.appName}",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 10.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottom(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 100.0,
          color: Colors.grey[900],
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image(
                    image: MemoryImage(widget.app.icon),
                    width: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.app.appName}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.app.versionName}",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white54,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
