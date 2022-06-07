import 'package:cherry/ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cherry/ui/pages/messages.dart';
import 'package:cherry/ui/pages/matches.dart';
import 'package:cherry/ui/pages/search.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Search(),
      Matches(),
      Messages(),
    ];

      return Theme(
        data: ThemeData(
          primaryColor: backgroundColor,
          accentColor: Colors.white,
        )
        , child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cherry",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: (){

                  },
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TabBar(
                        tabs: <Widget>[
                          Tab(icon: Icon(Icons.search),),
                          Tab(icon: Icon(Icons.people)),
                          Tab(icon: Icon(Icons.message)),

                        ])
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ),
      )
    );
  }
}
