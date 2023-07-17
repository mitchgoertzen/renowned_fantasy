import 'dart:async';
import 'package:flutter/material.dart';

import 'screens/team.dart';
import 'screens/matchup.dart';
import 'screens/league.dart';

class LeagueNavigator extends StatefulWidget {
  const LeagueNavigator({super.key});

  @override
  State<LeagueNavigator> createState() => _LeagueNavigatorState();
}

class _LeagueNavigatorState extends State<LeagueNavigator> {
  int _selectedIndex = 0;

  bool canback = false;

  Widget page = Team();

  List<int> tabStack = [0];

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Team(),
  //   Matchup(),
  //   League(),
  //   Placeholder()
  // ];

  void selectPage(int index) {
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

    setState(() {
      switch (index) {
        case 0:
          page = Team();
          break;
        case 1:
          page = Matchup();
          break;
        case 2:
          page = League();
          break;
        case 3:
          page = Placeholder();
          break;
      }
    });
  }

  void _onItemTapped(int index) {
    selectPage(index);
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: Center(
            child: page,
          ),
          bottomNavigationBar: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.09,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_sharp),
                  label: 'My Team',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.compare_arrows_sharp),
                  label: 'Matchup',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_numbered_rounded),
                  label: 'League',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_baseball_sharp),
                  label: 'MLB',
                ),
              ],
              currentIndex: _selectedIndex,
              elevation: 5,
              type: BottomNavigationBarType.fixed,
              iconSize: 26,
              selectedItemColor: theme.primaryColor,
              onTap: _onItemTapped,
            ),
          )),
    );
  }

  Future<bool> _onWillPop() async {
    if (tabStack.length == 1) {
      if (_selectedIndex != 0) {
        //stack is [1||2||3]
        tabStack.removeLast();
        setState(() {
          selectPage(0);
        });
      } else {
        return true;
      }
    } else {
      //stack is > 1
      tabStack.removeLast();
      setState(() {
        selectPage(tabStack.last);
      });
    }
    return false;
  }
}
