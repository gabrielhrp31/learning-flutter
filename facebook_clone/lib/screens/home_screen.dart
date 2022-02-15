import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              actions: [
                CircleButton(
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: (){

                    }
                ),
                CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: (){

                    }
                )
              ],
              systemOverlayStyle:const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.white,
              ) ,
              title: const Text(
                  "facebook",
                  style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  )
              ),
              bottom: TabBar(
                  labelColor: Palette.facebookBlue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(MdiIcons.home)
                    ),
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(
                          MdiIcons.home,
                      )
                    ),
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(MdiIcons.home)
                    ),
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(MdiIcons.accountCircle)
                    ),
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(MdiIcons.bell)
                    ),
                    IconButton(
                        onPressed: (){

                      },
                      icon: const Icon(MdiIcons.menu)
                    )
                  ],
                ),
            ),
            SliverToBoxAdapter(
              child:Expanded(
                child: TabBarView(
                  children: [
                    CreatePostContainer(
                        currentUser: currentUser
                    ),
                    Container(
                      height: 100,
                      child: Text("Watch"),
                    ),
                    Container(
                      height: 100,
                      child: Text("Marketplace"),
                    ),
                    Container(
                      height: 100,
                      child: Text("Profile"),
                    ),
                    Container(
                      height: 100,
                      child: Text("Notificações"),
                    ),
                    Container(
                      height: 100,
                      child: Text("Menu"),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
