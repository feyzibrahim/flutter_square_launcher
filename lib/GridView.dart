import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqaure_launcher/Eachicon.dart';

class GridViewByMine extends StatefulWidget {
  final List<Application> apps;

  GridViewByMine({
    this.apps,
  });

  @override
  _GridViewByMineState createState() => _GridViewByMineState();
}

class _GridViewByMineState extends State<GridViewByMine> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      crossAxisCount: 4,
      itemBuilder: (BuildContext context, int index) {
        ApplicationWithIcon app = widget.apps[index];
        return EachIcon(app: app);
      },
      staggeredTileBuilder: (int index) {
        // if (index == 1 || index == 10 || index == 19 || index == 37) {
        //   return StaggeredTile.count(2, 1.3);
        // } else
        return StaggeredTile.count(1, 1.3);
      },
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      itemCount: widget.apps.length,
    );
    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     ApplicationWithIcon app = widget.apps[index];
    //     return ListTile(
    //       title: Text(
    //         app.appName,
    //       ),
    //       leading: Image(
    //         image: MemoryImage(app.icon),
    //         width: 30.0,
    //       ),
    //       onTap: () {},
    //       onLongPress: () => _showBottom(context, app),
    //     );
    //   },
    //   itemCount: widget.apps.length,
    // );
  }
}
