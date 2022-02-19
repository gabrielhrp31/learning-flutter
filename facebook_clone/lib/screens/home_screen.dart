import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final int _iconSize = 28;

  final List<IconData> tabsIcon = [
    MdiIcons.home,
    MdiIcons.televisionPlay,
    MdiIcons.storeOutline,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu,
  ];

  _getTabs() {
    List<Tab> tabs  = [];
    for (IconData icon in tabsIcon) {
      tabs.add(Tab(icon: Icon(icon, size: 28)));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  actions: [
                    CircleButton(
                        icon: Icons.search, iconSize: 30.0, onPressed: () {}),
                    CircleButton(
                        icon: MdiIcons.facebookMessenger,
                        iconSize: 30.0,
                        onPressed: () {})
                  ],
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarColor: Colors.white,
                  ),
                  title: const Text("facebook",
                      style: TextStyle(
                        color: Palette.facebookBlue,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      )),
                  bottom: TabBar(
                    labelColor: Palette.facebookBlue,
                    unselectedLabelColor: Colors.grey,
                    tabs: _getTabs(),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                Text("aaa"),
                Text("Watch"),
                Text("Marketplace"),
                Text("Profile"),
                Text("Notifica��es"),
                Text("Menu")
              ],
            ),
          ),
        );
      }),
    );
  }
}
