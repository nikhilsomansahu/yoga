import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web2app/screens/latestpopst.dart';
import 'package:web2app/screens/photos.dart';
import 'package:web2app/screens/classes.dart';
import 'package:web2app/widgets/mydrawer.dart';
import '../screens/Categorypage.dart';

class MainTab extends StatefulWidget {
  MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(child: Text("LATEST")),
    Tab(child: Text("CLASSES")),
    Tab(child: Text("SERVICES")),
    Tab(child: Text("INSTRUCTORS")),
  ];

  @override
  void initState() {
    _tabController = TabController(length: topTabs.length, initialIndex: 0, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("on Will Pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(Duration(microseconds: 200), () {
      print("Set Index");
      _tabController?.index = 0;
    });
    print("Return");
    return _tabController?.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Yoga plus herbs',
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold ,
                ),
              ),
              actions: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.search),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      print('Search Button Clicked');
                    },
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 8, 240, 128),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 8, 240, 128),
                  ),
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                tabs: topTabs,
              ),
            ),
            endDrawer: Container(
              child: MyDrawer(),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                LatestPost(),
                CategoryPost(),
                Video(),
                Photo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}