import 'dart:async';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:flutter/material.dart';

import 'screens/team.dart';
import 'screens/matchup.dart';
import 'screens/league.dart';

class LeagueNavigator extends StatefulWidget {
  const LeagueNavigator({super.key});

  @override
  State<LeagueNavigator> createState() => _LeagueNavigatorState();
}

class _LeagueNavigatorState extends State<LeagueNavigator>
    with SingleTickerProviderStateMixin {

  int _selectedIndex = 0;
  
  List<int> tabStack = [0];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Team(),
    Matchup(),
    League(),
    Placeholder()
  ];

  void _selectPage(int index) {
    _selectedIndex = index;

    print('select page');

    //new page index already in stack
    if (tabStack.contains(_selectedIndex)) {
      if (tabStack.length > 1) {
        //remove index
        tabStack.remove(_selectedIndex);
        //push to top of stack
        tabStack.add(_selectedIndex);
      }
    } else {
      //push to top of stack
      tabStack.add(_selectedIndex);
    }

    _tabController.animateTo(index);
  }

  _bottomTabBar(ThemeData theme) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.09,
      child: TabBar(
        labelColor: theme.primaryColor,
        unselectedLabelColor: theme.disabledColor,
        indicatorColor: Colors.transparent,
        onTap: _selectPage,
        tabs: [
          _tabItem(Icons.people_alt_sharp, 'My Team', 0),
          _tabItem(Icons.compare_arrows_sharp, 'Matchup', 1),
          _tabItem(Icons.format_list_numbered_rounded, 'League', 2),
          _tabItem(Icons.sports_baseball_sharp, 'MLB', 3),
        ],
        controller: _tabController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    ThemeData theme = Theme.of(context);

    return WillPopScope(
        onWillPop: _onWillPop,
        child: appScaffold(
          context,
          Center(
            child: TabBarView(
              controller: _tabController,
              children: _widgetOptions,
            ),
          ),
          widget,
          _bottomTabBar(theme),
        ));
  }

  Future<bool> _onWillPop() async {
    if (tabStack.length == 1) {
      if (_selectedIndex != 0) {
        //stack is [1 || 2 || 3]
        tabStack.removeLast();
        setState(() {
          _selectPage(0);
        });
      } else {
        return true;
      }
    } else {
      //stack is > 1
      tabStack.removeLast();
      setState(() {
        _selectPage(tabStack.last);
      });
    }
    return false;
  }

  _tabItem(IconData icon, String label, int i) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(icon),
      Text(label, style: TextStyle(fontSize: 12),),
    ]);
  }
}
